# !!! Update !!!
This page largely describes the work done with the ESP31B and ESP8266 RTOS SDK. Many things changed between the ESP31B and the actual ESP32, not the least the SDK, which is now the IDF (IoT Developer Framework). At this point it seems likely that we'll end up with two separate branches for the ESP8266 and the ESP32 rather than a unified branch with everything running on RTOS.

For the most recent ESP32 progress updates, check out [issue 1319](https://github.com/nodemcu/nodemcu-firmware/issues/1319) and the `dev-esp32` branch.

# Intro
With the imminent arrival of the new ESP32 chip to succeed & surpass the ESP8266, work has commenced to get NodeMCU to run on the RTOS-SDK instead of the "non-OS SDK" as it has traditionally done. The reason for this being that on the ESP32 the RTOS-SDK is the only available SDK. Thus getting NodeMCU to run on the ESP8266 under RTOS serves a dual purpose, it both gets us prepared for the new hardware (once available), and (hopefully) gives us a consistent code-base between the ESP8266 and ESP32 versions of NodeMCU. Having to maintain two separate code bases to cater for ESP8266 and ESP32 is not seen as a viable option, so even if we face some feature regressions it may be a necessary evil.

# Work in progress
The RTOS migration is taking place on the `dev-rtos` branch, which was branched from commit afd974c5e9b942cf1124c9498dc9588ba73679e1 on the `dev` branch. These branches will diverge for a while, until they hopefully are merged back together with full RTOS support in place. During this time the rtos branch is not subject to the usual somewhat stringent PR-based approach of getting code changes in, but a more free-for-all between the committers to try to bang the branch into shape as quickly as possible, before going back to a PR based approach for final polishing. PRs from non-committers who wish to help with the RTOS migration are definitely welcomed too!

# Building the dev-rtos branch
The `dev-rtos` branch now has a submodule with pre-compiled toolchains for both ESP8266 and ESP32 (Linux x86_64 host). The following steps should be enough to get you started:
```
cd /some/where
git clone -b dev-rtos https://github.com/nodemcu/nodemcu-firmware.git
cd nodemcu-firmware
git submodule update --init
PATH=$PWD/tools/toolchains/esp8266/bin:$PWD/tools/toolchains/esp32/bin:$PATH
make HW=ESP8266 # or just "make"; ESP8266 is the default
make HW=ESP32
```
You are not forced to use these toolchains, but they are what our automated CI uses and will be what the cloud builder uses as well.

# RTOS differences
The main difference between the non-OS SDK and the RTOS SDK is that the latter implements priority-based preemptive multitasking. What this means is that the network stack is effectively able to interrupt the Lua environment at any point, in order to handle radio communication. This leads to a much more stable network stack, and reduced timing constraints on Lua code. It also provides improved mechanics for low-level drivers to deliver more accurate protocol timings, if implemented to take advantage of the RTOS features. 

Naturally, these features come at a cost in terms of overhead in memory and processor usage, with the former being the far more noticeable. Each RTOS task (not to be confused with a NodeMCU `task/task.h` task) has its own stack that it is executing from, rather than sharing one system-wide stack.

The following RTOS tasks are used (higher priority values indicate higher priority scheduling) in the ESP8266 RTOS:
  - Priority 14, "uiT": SDK task, runs the `user_init()` callback among other things.
  - Priority 13, "ppT": SDK task, handles the low-level radio etc.
  - Priority 12, "rtT": SDK task, dispatches real-time timer callbacks (`os_timer_xxx`)
  - Priority 10, "tiT": SDK task, TCP/IP stack including dispatching sent/recv callbacks.
  - Priority 3, "nodemcu": runs the Lua VM and supporting modules.
  - Priority 2, "???": RTOS software timer task.
  - Priority 0, "???": RTOS idle task.

On the ESP32 RTOS, things look a bit different despite what the SDK docs stay (it hasn't been updated from the ESP8266 version). This is probably not a complete list:
  - Priority 23, pp: SDK task, handles the low-level radio etc.
  - Priority 22, frc2_timer_task: SDK task presumably for handling Free-Running Counter 2...
  - Priority 20, tcpip: SDK task, TCP/IP stack
  - Priority 2, "nodemcu": runs the Lua VM and supporting modules.
  - Priority 1, "???": RTOS software timer task.
  - Priority 0, "???": RTOS idle task.


Contrary to the behavior of SDK callbacks in the non-OS SDK, in the RTOS SDK they must for all intents and purposes be considered to be executing out of an interrupt context, and as such MUST NOT interact with the main `nodemcu` RTOS task other than through well-defined inter-task interfaces such as Queues and Semaphores. Terry summarized it well in saying *"we should be thinking about extending our model for ISRs and adopt an asymmetric Lua-land / other-land approach. We can't use a symmetric mutex approach because of the Lua process's heavy stack use; We can't (at least on the ESP8266) allow multiple tasks to demand a large stack. I feel that we should think in terms of a 1+N structure where the Lua task is "special" and that all callback tasks do a task post which queues a request to the Lua task when they need to xfer control into Lua-land."*

The `sntp` module was the first module to be transitioned to RTOS compatibility, and can be used as a guide on how to approach converting other modules.

To minimize the memory impact of stacks, additional RTOS tasks should not be created lightly, though some drivers *could* find it useful and appropriate to do so. In such case, the stack size should be set to the absolute minimum, and ideally said RTOS task should be a transient task which only exists while the driver is in use.

Due to the very low priority of the RTOS timer task on the ESP32, RTOS timers are not advisable to use. This is due to the fact that low-priority ("idle") NodeMCU tasks will take preemptive priority, thus potentially blocking such timers indefinitely.

# Migration status
The core of NodeMCU has been successfully migrated over to RTOS, but the modules and drivers are an ongoing work. The following table summarized the last-known state of the `dev-rtos` branch in this regard; modules not mentioned here can be assumed to not be RTOS ready.

|Module name|RTOS-safe callbacks/timers|Stack usage limited|ESP32 compatible|Other notes|
|-----------|-------------------|----------------------------|-------------------|-----------|
|sntp| :white_check_mark: | :white_check_mark: | | |
|tmr| :white_check_mark: | :white_check_mark: | | |
|node| partially | ? | | `node.output()` is RTOS ready |
|adc| :white_check_mark: | :white_check_mark: | | |

Note: jmattsson is currently not making much progress on this branch due to being otherwise distracted at work, and his ESP32 (well, 31B) board mysteriously failing to boot despite the SPI comms probing out okay. May need to wait for a retail sample of the ESP32 to get the momentum back here.

# Other notes and references
  - Under the RTOS SDK NodeMCU uses regular C library functions; the old `c_xxx` functions have been removed (with one or two specific exceptions). Also avoid using `os_xxx` versions of standard C functions, they will if anything be slower than their counterparts.
  - [FreeRTOS API reference](http://www.freertos.org/a00106.html). Note the ESP8266 version of FreeRTOS is 7.5.2, so some newer features are not available there.
  - [Issue 1319](https://github.com/nodemcu/nodemcu-firmware/issues/1319) contains additional discussion on the migration effort.
