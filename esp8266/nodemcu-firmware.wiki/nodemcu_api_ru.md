# **Описание NodeMCU API** #
Перевод 4refr0nt [esp8266.ru](http://esp8266.ru)<br />
[Обсуждение перевода](http://esp8266.ru/forum/threads/russkij-perevod-nodemcu-api.138/)
###Версия перевода 
09.03.2015

###TODO
Перевод команд onewire, bit и spi<br />

###NodeMCU version 0.9.5 build 2015-02-13


##INDEX
 - [Change Log](https://github.com/nodemcu/nodemcu-firmware/wiki)
 - [New GPIO Map](#new_gpio_map)
 - [Old GPIO Map](#old_gpio_map)

###Команды node
 - [node.restart()](#noderestart)
 - [node.dsleep()](#nodedsleep)
 - [node.info()](#nodeinfo)
 - [node.chipid()](#nodechipid)
 - [node.flashid()](#nodeflashid)
 - [node.heap()](#nodeheap)
 - [node.key()](#nodekey) --deprecated
 - [node.led()](#nodeled) --deprecated
 - [node.input()](#nodeinput)
 - [node.output()](#nodeoutput)
 - [node.readvdd33()](#nodereadvdd33)
 - [node.compile()](#nodecompile)

###Файловая система
 - [file.remove()](#fileremove)
 - [file.open()](#fileopen)
 - [file.close()](#fileclose)
 - [file.readline()](#filereadline)
 - [file.writeline()](#filewriteline)
 - [file.read()](#fileread)
 - [file.write()](#filewrite)
 - [file.flush()](#fileflush)
 - [file.seek()](#fileseek)
 - [file.list()](#filelist)
 - [file.format()](#fileformat)
 - [file.rename()](#filerename)

###wifi
 - [wifi.setmode(mode)](#wifisetmode)
 - [wifi.getmode(mode)](#wifigetmode)
 - [wifi.startsmart()](#wifistartsmart)
 - [wifi.stopsmart()](#wifistopsmart)
 - [wifi.sleeptype()](#wifisleeptype)

###wifi.sta клиент
 - [wifi.sta.config()](#wifistaconfig)
 - [wifi.sta.connect()](#wifistaconnect)
 - [wifi.sta.disconnect()](#wifistadisconnect)
 - [wifi.sta.autoconnect()](#wifistaautoconnect)
 - [wifi.sta.getip()](#wifistagetip)
 - [wifi.sta.setip()](#wifistasetip)
 - [wifi.sta.getmac()](#wifistagetmac)
 - [wifi.sta.setmac()](#wifistasetmac)
 - [wifi.sta.getap()](#wifistagetap)
 - [wifi.sta.status()](#wifistastatus)
 - [wifi.sta.getbroadcast()](#wifistagetbroadcast)
 
###wifi.ap точка доступа
 - [wifi.ap.config()](#wifiapconfig)
 - [wifi.ap.getip()](#wifiapgetip)
 - [wifi.ap.setip()](#wifiapsetip)
 - [wifi.ap.getmac()](#wifiapgetmac)
 - [wifi.ap.setmac()](#wifiapsetmac)
 - [wifi.ap.getbroadcast()](#wifiapgetbroadcast)

###timer 
 - [tmr.delay()](#tmrdelay)
 - [tmr.now()](#tmrnow)
 - [tmr.alarm()](#tmralarm)
 - [tmr.stop()](#tmrstop)
 - [tmr.wdclr()](#tmrwdclr)
 - [tmr.time()](#tmrtime)

###gpio
 - [gpio.mode()](#gpiomode)
 - [gpio.read()](#gpioread)
 - [gpio.write()](#gpiowrite)
 - [gpio.trig()](#gpiotrig)

###pwm ШИМ
- [pwm.setup()](#pwmsetup)
- [pwm.close()](#pwmclose)
- [pwm.start()](#pwmstart)
- [pwm.stop()](#pwmstop)
- [pwm.setclock()](#pwmsetclock)
- [pwm.getclock()](#pwmgetclock)
- [pwm.setduty()](#pwmsetduty)
- [pwm.getduty()](#pwmgetduty)

###net module
 - [net.createServer()](#netcreateserver)
 - [net.createConnection()](#netcreateconnection)

###net.server sub-module
 - [net.server:listen()](#netserverlisten)
 - [net.server:close()](#netserverclose)

###net.socket sub-module
 - [net.socket:connect()](#netsocketconnect)
 - [net.socket:send()](#netsocketsend)
 - [net.socket:on()](#netsocketon)
 - [net.socket:close()](#netsocketclose)
 - [net.socket:dns()](#netsocketdns)

###i2c module
 - [i2c.setup()](#i2csetup)
 - [i2c.start()](#i2cstart)
 - [i2c.stop()](#i2cstop)
 - [i2c.address()](#i2caddress)
 - [i2c.write()](#i2cwrite)
 - [i2c.read()](#i2cread)

###adc module
 - [adc.read()](#adcread)

###uart module
 - [uart.setup()](#uartsetup)
 - [uart.on()](#uarton)
 - [uart.write()](#uartwrite)

###1-wire module
 - [ow.setup()](#owsetup)
 - [ow.reset()](#owreset)
 - [ow.skip()](#owskip)
 - [ow.select()](#owselect)
 - [ow.write()](#owwrite)
 - [ow.write_bytes()](#owwritebytes)
 - [ow.read()](#owread)
 - [ow.read_bytes()](#owreadbytes)
 - [ow.depower()](#owdepower)
 - [ow.reset_search()](#owresetsearch)
 - [ow.target_search()](#owtargetsearch)
 - [ow.search()](#owsearch)
 - [ow.crc8()](#owcrc8)
 - [ow.check_crc16()](#owcheckcrc16)
 - [ow.crc16()](#owcrc16)

###bit module
 - [bit.bnot()](#bitbnot)
 - [bit.band()](#bitband)
 - [bit.bor()](#bitbor)
 - [bit.bxor()](#bitbxor)
 - [bit.lshift()](#bitlshift)
 - [bit.rshift()](#bitrshift)
 - [bit.arshift()](#bitarshift)
 - [bit.bit()](#bitbit)
 - [bit.set()](#bitset)
 - [bit.clear()](#bitclear)
 - [bit.isset()](#bitisset)
 - [bit.isclear()](#bitisclear)

###spi module
 - [spi.setup()](#spisetup)
 - [spi.send()](#spisend)
 - [spi.recv()](#spirecv)

###mqtt module
 - [mqtt.Client()](#mqttclient)

###mqtt.client sub-module
 - [mqtt.client:lwt()](#mqttclientlwt)
 - [mqtt.client:connect()](#mqttclientconnect)
 - [mqtt.client:close()](#mqttclientclose)
 - [mqtt.client:publish()](#mqttclientpublish)
 - [mqtt.client:subscribe()](#mqttclientsubscribe)
 - [mqtt.client:on()](#mqttclienton)

**-**[Содержание](#index)

##Новая таблица GPIO (начиная с версии 20141219 и более поздние)

##new_gpio_map

| IO индекс| ESP8266 пин | IO индекс| ESP8266 пин |
|---------:|:------------|---------:|:------------|
|    0 [*] | GPIO16      |        7 | GPIO13      |        
|        1 | GPIO5       |        8 | GPIO15      |
|        2 | GPIO4       |        9 | GPIO3       |
|        3 | GPIO0       |       10 | GPIO1       |
|        4 | GPIO2       |       11 | GPIO9       |
|        5 | GPIO14      |       12 | GPIO10      |
|        6 | GPIO12      |          |             |


** [*] D0(GPIO16) может быть использован только как gpio чтение/запись. Нет поддержки прерываний. Нет pwm/i2c/ow **

**-**[Содержание](#index)

##Старая таблица GPIO (до версии 20141212)

##old_gpio_map
| IO индекс| ESP8266 пин | IO индекс| ESP8266 пин |
|---------:|:------------|---------:|:------------|
|        0 | GPIO12      |        6 | GPIO9       |
|        1 | GPIO13      |        7 | GPIO10      |
|        2 | GPIO14      |        8 | GPIO0       |
|        3 | GPIO15      |        9 | GPIO2       |
|        4 | GPIO3       |       10 | GPIO4       |
|        5 | GPIO1       |       11 | GPIO5       |
  
**-**[Содержание](#index)

#Как прошить NodeMCU
###Адрес

nodemcu_512k.bin: 0x00000<br />
Используйте NodeMCU flash tool:<br />
[nodemcu-flasher](https://github.com/nodemcu/nodemcu-flasher)
или любую другую программу

#node
## node.restart()
####Описание
Перезагрузка устройства

####Синтакс
node.restart()

####Параметры
 - `nil`

####Возвращаемые значения
 - `nil`

####Пример
   
```lua
    node.restart();
```

####Смотри также
 - [Содержание](#index)


## node.dsleep()
####Описание
Переход в режим глубокого сна, просыпается по таймауту

####Синтаксис
`node.dsleep(us, option)`

**Примечание:** Эта функция может быть использована только тогда, когда esp8266 PIN32(RST) и PIN8(XPD_DCDC aka GPIO16) соединены вместе.

####Параметры
 - `us`: number(Integer) или nil, время в микросекундах. Если us = 0, то засыпает "навсегда". Если us = nil, время сна не будет установлено.

 - `option`: number(Integer) or nil. Если option = nil, будет установлено предыдущее значение по умолчанию.

####Возвращает
- `nil`

####Пример

```lua
    --do nothing
    node.dsleep()
    --sleep μs
    node.dsleep(1000000)
    --set sleep option, then sleep μs
    node.dsleep(1000000, 4)
    --set sleep option only
    node.dsleep(nil,4)
```

####Смотри также
**-** [Содержание](#index)


## node.info()
####Описание
Возвращает версию NodeMCU, chipid, flashid, размер flash, режим flash, скорость flash.

####Синтаксис
`node.info()`

####Параметры
 - `nil`

####Возвращает
 - `majorVer` (number)
 - `minorVer` (number)
 - `devVer` (number)
 - `chipid` (number)
 - `flashid` (number)
 - `flashsize` (number)
 - `flashmode` (number)
 - `flashspeed` (number)

####Пример

```lua
    majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
    print("NodeMCU "..majorVer.."."..minorVer.."."..devVer)
```

####Смотри также
**-** [Содержание](#index)


## node.chipid()
####Описание
Возвращает chip ID

####Синтаксис
node.chipid()

####Параметры
nil

####Возвращает
number:chip ID

####Пример

```lua
    id = node.chipid();
```

####Смотри также
**-** [Содержание](#index)


## node.flashid()
####Описание
Возвращает flashid ID

####Синтаксис
node.flashid()

####Параметры
nil

####Возвращает
number:flash ID

####Пример

```lua
    flashid = node.flashid();
```

####Смотри также
**-** [Содержание](#index)


## node.heap()
####Описание
Возвращает размер свободной памяти в байтах

####Синтаксис
node.heap()

####Параметры
nil

####Возвращает
number: размер свободной памяти в байтах

####Пример

```lua
    heap_size = node.heap();
```

####Смотри также
**-** [Содержание](#index)


## node.key()
####Описание
Задает функцию, вызываемую при нажатии ключа, ключ подключен к GPIO16.

####Синтаксис
node.key(type, function())

####Параметры
type: тип нажатия, строка "long" или "short". long: нажать и удерживать более 3 сек, short: короткое нажатие(менее 3 сек)<br />
function(): пользовательская функция, которая будет выполнена при нажатии ключа. Если nil, отменяет вызов функции по нажатию.<br />
Действие по умолчанию: long: изменяет частоту мерцания светодиода,  short: сброс чипа

####Возвращаемые значения
nil

####Пример    
```lua
    node.key("long", function() print('hello world') end)
```

####Смотрите также
**-** [node.led](#nodeled)

**-** [Содержание](#index)


## node.led()
####Описание
Задает время включения/выключения светодиода, подключенного к GPIO16, аналогично node.key()

####Синтаксис
node.led(low, high)

####Параметры
Low: время нахождения светодиода в ВЫКЛЮЧЕННОМ состоянии, При low=0 светодио включен всегда. Время задается в миллисекундах, разрешение: 80~100мс<br />
High: время нахождения светодиода в ВКЛЮЧЕННОМ состоянии. Время задается в миллисекундах, разрешение: 80~100мс

####Возвращаемые значения
nil

####Пример

```lua
    -- светодиод включен постоянно
    node.led(0);
```

####Смотрите также
**-** [node.key](#nodekey)

**-** [Содержание](#index)


## node.input()
####Описание
Принимает строку и передает ее на выполнение в Lua интепретатор.<br />
Аналогично pcall(loadstring(str)), но поддерживает значения, состоящие из нескольких строк.

####Синтаксис
node.input(str)

####Параметры
str: Lua порция, чанк (chunk)

####Возвращаемые значения
nil

####Пример

```lua
    -- never use node.input() in console. no effect.
    sk:on("receive", function(conn, payload) node.input(payload) end)
```

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## node.output()
####Описание
Прямой вывод из lua интерпретатора в функцию

####Синтаксис
node.output(function(str), serial_debug)

####Параметры
function(str): функция, принимающая str (может передать данные в сокет).<br />
serial_debug: 1 вывод также в последовательный порт. 0: без вывода в последовательный порт

####Возвращаемые значения
nil

####Пример

```lua
    function tonet(str)
      sk:send(str)
      -- print(str) WRONG!!! never ever print something in this function
      -- because this will cause a recursive function call!!!
    end
    node.ouput(tonet, 1)  -- serial also get the lua output.
```

```lua
    -- a simple telnet server
    s=net.createServer(net.TCP) 
    s:listen(2323,function(c) 
       con_std = c 
       function s_output(str) 
          if(con_std~=nil) 
             then con_std:send(str) 
          end 
       end 
       node.output(s_output, 0)   -- re-direct output to function s_ouput.
       c:on("receive",function(c,l) 
          node.input(l)           -- works like pcall(loadstring(l)) but support multiple separate line
       end) 
       c:on("disconnection",function(c) 
          con_std = nil 
          node.output(nil)        -- un-regist the redirect output function, output goes to serial
       end) 
    end)
```

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## node.readvdd33()
####Описание
Считывает значение напряжения на пине vdd33

####Синтаксис
node.readvdd33()

####Параметры
нет
####Возвращаемые значения
mV

####Пример

```lua
    print(node.readvdd33())
```
output
>3345

```lua
    v = node.readvdd33() / 1000
    print(v)
    v=nil
```
output
>3.315

####Смотрите также
**-**   []()

**-** [Содержание](#index)

## node.compile()
####Описание
Компилирует lua текстовый файл в бинарный lua файл и сохраняет его с расширением .lc

####Синтаксис
node.compile("file.lua")

####Параметры
lua текстовый файл с расширением ".lua"
####Возвращаемые значения
nil

####Пример

```lua
  file.open("hello.lua","w+")
  file.writeline([[print("hello nodemcu")]])
  file.writeline([[print(node.heap())]])
  file.close()

  node.compile("hello.lua")
  dofile("hello.lua")
  dofile("hello.lc")
```

####Смотрите также
**-**   []()

**-** [Содержание](#index)


#file module
## file.remove()
####Описание
Удаляет файл из файловой системы

####Синтаксис
file.remove(filename)

####Параметры
filename: имя файла для удаления

####Возвращаемые значения
nil

####Пример

```lua
    -- remove "foo.lua" from file system.
    file.remove("foo.lua")
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.close()](#file_close)

**-** [Содержание](#index)


## file.open()
####Описание
Открывает файл для чтения/записи

####Синтаксис
file.open(filename, mode)

####Параметры
filename: имя файла, папки/каталоги не поддерживаются<br />
режим:<br />
   "r": чтение (по умолчанию)<br />
   "w": запись<br />
   "a": добавление<br />
   "r+": обновление, все предыдущие данные сохраняются<br />
   "w+": обновление, все предыдущие данные удаляются<br />
   "a+": добавление c обновлением, предыдущие данные сохраняются, запись доступна только в конец файла

####Возвращаемые значения
nil: файл не существует или не может быть открыт
true: успешное открытие файла

####Пример

```lua
    -- open 'init.lua', print the first line.
    file.open("init.lua", "r")
    print(file.readline())
    file.close()
```

####Смотрите также
**-**   [file.close()](#file_close)<br />
**-**   [file.readline()](#file_readline)

**-** [Содержание](#index)


## file.close()
####Описание
Закрывает открытый ранее файл

####Синтаксис
file.close()

####Параметры
nil

####Возвращаемые значения
nil

####Пример

```lua
    -- open 'init.lua', print the first line.
    file.open("init.lua", "r")
    print(file.readline())
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.readline()](#file_readline)

**-** [Содержание](#index)


## file.readline()
####Описание
Считывает одну строку из ранее открытого файла

####Синтаксис
file.readline()

####Параметры
nil

####Возвращаемые значения
Содержимое файла, строка за строкой, включая символ конца строки EOL('\n')<br />
Возвращает nil при достижении конца файла (EOF).

####Пример

```lua
    -- print the first line of 'init.lua'
    file.open("init.lua", "r")
    print(file.readline())
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.close()](#file_close)

**-** [Содержание](#index)


## file.writeline()
####Описание
Записывает строку в ранее открытый файл добавляя в ее конец символ конца строки '\n'.

####Синтаксис
file.writeline(string)

####Параметры
string: строка для записи в файл

####Возвращаемые значения
true: успех
nil: ошибка

####Пример

```lua
    -- open 'init.lua' in 'a+' mode
    file.open("init.lua", "a+")
    -- write 'foo bar' to the end of the file
    file.writeline('foo bar')
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.write()](#file_write)

**-** [Содержание](#index)


## file.read()
####Описание
Чтение содержимого ранее открытого файла

####Синтаксис
file.read()

####Параметры
Если параметры не указаны, то возвращает все содержимое файла
Если указано целое число n, то происходит чтение только n байт из файла, или меньше, если обнаружен конец файла EOF
Если указана строка "q", то происходит чтение из файла до тех пор, пока не встретится 'q' или обнаружен конец файла EOF

####Возвращаемые значения
Содержимое файла в виде строки<br />
Возвращает nil если обнаружен конец файла EOF

####Пример

```lua
    -- print the first line of 'init.lua'
    file.open("init.lua", "r")
    print(file.read('\r'))
    file.close()

    -- print the first 5 byte of 'init.lua'
    file.open("init.lua", "r")
    print(file.read(5))
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.close()](#file_close)

**-** [Содержание](#index)


## file.write()
####Описание
Запись в файл

####Синтаксис
file.write(string)

####Параметры
string: содержимое для записи в файл

####Возвращаемые значения
true: успех
nil: ошибка

####Пример

```lua
    -- open 'init.lua' in 'a+' mode
    file.open("init.lua", "a+")
    -- write 'foo bar' to the end of the file
    file.write('foo bar')
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.writeline()](#file_writeline)

**-** [Содержание](#index)


## file.flush()
####Описание
Сохраняет все данные, записанные в файл

####Синтаксис
file.flush()

####Параметры
nil

####Возвращаемые значения
nil

####Пример

```lua
    -- open 'init.lua' in 'a+' mode
    file.open("init.lua", "a+")
    -- write 'foo bar' to the end of the file
    file.write('foo bar')
    file.flush()
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.writeline()](#file_writeline)

**-** [Содержание](#index)


## file.seek()
####Описание
Управляет позицией указателя в файле, отсчет идет от начала файла, к позиции со смещением плюс база, задаваемая строкой whence.

####Синтаксис
file.seek(whence, offset)

####Параметры
whence:<br />
"set": базовая позиция 0 (начало файла);<br />
"cur": считать базовой текущую позицию;(по умолчанию)<br />
"end": базовая позиция конец файла EOF;<br />
offset: смещение, по умолчанию 0

####Возвращаемые значения
успех: возвращает позицию в файле после выполнения операции<br />
ошибка: возвращает nil

####Пример

```lua
    -- open 'init.lua' in 'a+' mode
    file.open("init.lua", "a+")
    -- write 'foo bar' to the end of the file
    file.write('foo bar')
    file.flush()
    file.seek("set")
    print(file.readline())
    file.close()
```

####Смотрите также
**-**   [file.open()](#file_open)<br />
**-**   [file.writeline()](#file_writeline)

**-** [Содержание](#index)


## file.list()
####Описание
Список всех файлов

####Синтаксис
file.list()

####Параметры
nil

####Возвращаемые значения
таблица lua со структурой {file name: file size}

####Пример

```lua
    l = file.list();
    for k,v in pairs(l) do
      print("name:"..k..", size:"..v)
    end
```

####Смотрите также
**-**   [file.remove()](#file_remove)

**-** [Содержание](#index)


## file.format()
####Описание
Форматирование файловой системы

####Синтаксис
file.format()

####Параметры
nil

####Возвращаемые значения
nil

####Пример

```lua
    file.format()
```

####Смотрите также
**-**   [file.remove()](#file_remove)

**-** [Содержание](#index)

## file.rename()
####Описание
Переименование файла. **Примечание:** если файл был открыт ранее, то происходит закрытие файла

####Синтаксис
file.rename(oldname, newname)

####Параметры
oldname: старое имя файла, директории/папки/каталоги не поддерживаются<br />
newname: новое имя файла, директории/папки/каталоги не поддерживаются<br />

####Возвращаемые значения
false: ошибка
true: успех

####Пример

```lua
    -- rename file 'temp.lua' to 'init.lua'.
    file.rename("temp.lua","init.lua")
```

####Смотрите также
**-**   [file.close()](#file_close)<br />

**-** [Содержание](#index)


#wifi
##Константы
wifi.STATION, wifi.SOFTAP, wifi.STATIONAP


## wifi.setmode()
####Описание
Устанавливает режим wifi клиента и/или точки доступа (mode)

####Синтаксис
wifi.setmode(mode)

####Параметры
mode: одна из констант: wifi.STATION, wifi.SOFTAP or wifi.STATIONAP

####Возвращаемые значения
Текущий режим после выполнения команды

####Пример

```lua
    wifi.setmode(wifi.STATION)
```

####Смотрите также
**-**   [wifi.getmode()](#wifi_getmode)


**-** [Содержание](#index)


## wifi.getmode()
####Описание
Позволяет получить текущий режим wifi.

####Синтаксис
wifi.getmode()

####Параметры
nil

####Возвращаемые значения
wifi режим

####Пример

```lua
    print(wifi.getmode())
```

####Смотрите также
**-**   [wifi.setmode()](#wifi_setmode)


**-** [Содержание](#index)


## wifi.startsmart()
####Описание
Запускает процесс автоконфигурации, если успешно, то устанавливает ssid и пароль

####Синтаксис
wifi.startsmart(channel, function succeed_callback())

####Параметры

channel: 1~13, стартовый канал для поиска, если nil, то 6 по умолчанию.  20 сек на каждый канал.<br />
succeed_callback: функция, которая вызывается после успешного выполнения команды и подключения к точке доступа

####Возвращаемые значения
nil

####Пример

```lua
    wifi.startsmart(6, function() end)
```

####Смотрите также
**-**   [wifi.stopsmart()](#wifi_stopsmart)


**-** [Содержание](#index)


## wifi.stopsmart()
####Описание
Остановка процесса автоконфигурации

####Синтаксис
wifi.stopsmart()

####Параметры
nil

####Возвращаемые значения
nil

####Пример

```lua
    wifi.stopsmart()
```

####Смотрите также
**-**   [wifi.startsmart()](#wifi_startsmart)

**-** [Содержание](#index)


## wifi.sleeptype()
####Описание
Задает режим сна для wifi модема

####Синтаксис
type_actual = wifi.sleeptype(type_need)

####Параметры
type_need:<br />
wifi.NONE_SLEEP, wifi.LIGHT_SLEEP, wifi.MODEM_SLEEP

####Возвращаемые значения
type_actual:<br />
wifi.NONE_SLEEP, wifi.LIGHT_SLEEP, wifi.MODEM_SLEEP

####Пример

```lua
    realtype = wifi.sleeptype(wifi.MODEM_SLEEP)
```

####Смотрите также
**-**   [node.dsleep()](#node_dsleep)

**-** [Содержание](#index)


#wifi.sta module


## wifi.sta.config()
####Описание
Задает ssid и пароль роутера, к которому подключаемся в режиме wifi клиента

####Синтаксис
wifi.sta.config(ssid, password)

####Параметры

ssid: строка длинной менее 32 байт.<br />
password: строка длинной менее 64 байт.

####Возвращаемые значения
nil

####Пример

```lua
    wifi.sta.config("myssid","mypassword")
```

####Смотрите также
**-**   [wifi.sta.connect()](#wifi_sta_connect)<br />
**-**   [wifi.sta.disconnect()](#wifi_sta_disconnect)


**-** [Содержание](#index)


## wifi.sta.connect()
####Описание
Подключается к wifi точке доступа (режим wifi клиента)

####Синтаксис
wifi.sta.connect()

####Параметры
nil


####Возвращаемые значения
nil

####Пример

```lua
    wifi.sta.connect()
```

####Смотрите также
**-**   [wifi.sta.disconnect()](#wifi_sta_disconnect)<br />
**-**   [wifi.sta.config()](#wifi_sta_config)


**-** [Содержание](#index)


## wifi.sta.disconnect()
####Описание
Отключается от wifi точки доступа (режим wifi клиента)

####Синтаксис
wifi.sta.disconnect()

####Параметры
nil


####Возвращаемые значения
nil

####Пример

```lua
    wifi.sta.disconnect()
```

####Смотрите также
**-**   [wifi.sta.config()](#wifi_sta_config)<br />
**-**   [wifi.sta.connect()](#wifi_sta_connect)


**-** [Содержание](#index)


## wifi.sta.autoconnect()
####Описание
Задает автоподключение к wifi точке доступа (режим wifi клиента)
auto connect to AP in station mode.

####Синтаксис
wifi.sta.autoconnect(auto)

####Параметры
auto: 0 отключить автоподключение. 1 включить автоподключение


####Возвращаемые значения
nil

####Пример

```lua
    wifi.sta.autoconnect()
```

####Смотрите также
**-**   [wifi.sta.config()](#wifi_sta_config)<br />
**-**   [wifi.sta.connect()](#wifi_sta_connect)<br />
**-**   [wifi.sta.disconnect()](#wifi_sta_disconnect)


**-** [Содержание](#index)


## wifi.sta.getip()
####Описание
Позволяет получить ip адрес, маску, шлюз по умолчанию (режим wifi клиента)

####Синтаксис
wifi.sta.getip()

####Параметры
nil


####Возвращаемые значения
ip адрес, маска, шлюз (строка, например:"192.168.0.111")<br />
nil если ip = "0.0.0.0".

####Пример

```lua
    -- print current ip, netmask, gateway
    print(wifi.sta.getip())
    -- 192.168.0.111  255.255.255.0  192.168.0.1
    ip = wifi.sta.getip()
    print(ip)
    -- 192.168.0.111
    ip, nm = wifi.sta.getip()
    print(nm)
    -- 255.255.255.0

```

####Смотрите также
**-**   [wifi.sta.getmac()](#wifi_sta_getmac)


**-** [Содержание](#index)


## wifi.sta.setip()
####Описание
Задает статический ip адрес, маску и шлюз по умолчанию (режим wifi клиента)

####Синтаксис
wifi.sta.setip(cfg)

####Параметры
cfg: таблица, содержащая ip, маску и шлюз<br />
```lua
{
  "ip":"192.168.0.111",
  "netmask":"255.255.255.0",
  "gateway":"192.168.0.1"
}
```

####Возвращаемые значения
true если успешно<br />
false если ошибка

####Пример

```lua
  cfg =
  {
    "ip":"192.168.0.111",
    "netmask":"255.255.255.0",
    "gateway":"192.168.0.1"
  }
  wifi.sta.setip(cfg)

```

####Смотрите также
**-**   [wifi.sta.setmac()](#wifi_sta_setmac)

**-** [Содержание](#index)


## wifi.sta.getmac()
####Описание
Позволяет получить MAC адрес (режим wifi клиента)

####Синтаксис
wifi.sta.getmac()

####Параметры
nil


####Возвращаемые значения
mac адрес как строка, например:"18-33-44-FE-55-BB"

####Пример

```lua
    -- print current mac address
    print(wifi.sta.getmac())
```

####Смотрите также
**-**   [wifi.sta.getip()](#wifi_sta_getip)

**-** [Содержание](#index)


## wifi.sta.setmac()
####Описание
Позволяет задать MAC адрес (режим wifi клиента)

####Синтаксис
wifi.sta.setmac(mac)

####Параметры
mac адрес как строка байт, например:"\024\024\024\024\024\024"

####Возвращаемые значения
true успех, false если ошибка

####Пример
```lua
    print(wifi.sta.setmac("\024\024\024\024\024\024"))
```

####Смотрите также
**-**   [wifi.sta.setip()](#wifi_sta_setip)

**-** [Содержание](#index)


## wifi.sta.getap()
####Описание
Сканирует wifi сеть и передает список доступных точек доступа lua таблицей в функцию

####Синтаксис
wifi.sta.getap(function(table))

####Параметры
function(table): функция, которая вызывается по окончании сканирования сети<br />
эта функция получает таблицу, с ключевым полем ssid, другие значения: authmode,rssi,bssid,channel


####Возвращаемые значения
nil

####Пример

```lua
    -- print ap list
    function listap(t)
      for k,v in pairs(t) do
        print(k.." : "..v)
      end
    end
    wifi.sta.getap(listap)
```

####Смотрите также
**-**   [wifi.sta.getip()](#wifi_sta_getip)

**-** [Содержание](#index)


## wifi.sta.status()
####Описание
Позволяет получить текущий статус

####Синтаксис
wifi.sta.status()

####Параметры
nil

####Возвращаемые значения
number： 0~5
0: STATION_IDLE,
1: STATION_CONNECTING,
2: STATION_WRONG_PASSWORD,
3: STATION_NO_AP_FOUND,
4: STATION_CONNECT_FAIL,
5: STATION_GOT_IP.

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## wifi.sta.getbroadcast()
####Описание
Позволяет получить broadcast адрес подсети

####Синтаксис
wifi.sta.getbroadcast()

####Параметры
nil


####Возвращаемые значения
getbroadcast address строка, например:"192.168.0.255"<br />
возвращает nil если ip = "0.0.0.0".

####Пример

```lua
    bc = wifi.sta.getbroadcast()
    print(bc)
    -- 192.168.0.255

```

####Смотрите также
**-**   [wifi.sta.getip()](#wifi_sta_getip)


**-** [Содержание](#index)


#wifi.ap


## wifi.ap.config()
####Описание
Задает ssid и пароль сети в режиме точки доступа

####Синтаксис
wifi.ap.config(cfg)

####Параметры
cfg: lua таблица параметров

####Пример:

```lua
     cfg={}
     cfg.ssid="myssid"
     cfg.pwd="mypwd"
     wifi.ap.config(cfg)
```

####Возвращаемые значения
nil

####Смотрите также
**-**    []()

**-** [Содержание](#index)


## wifi.ap.getip()
####Описание
Позволяет получить ip адрес, маску и шлюз по умолчанию в режиме точки доступа

####Синтаксис
wifi.ap.getip()

####Параметры
nil

####Возвращаемые значения
ip, netmask, gateway address строка, например:"192.168.0.111"<br />
возвращает nil если ip = "0.0.0.0".

####Пример

```lua
    -- print current ip, netmask, gateway
    print(wifi.ap.getip())
    -- 192.168.4.1  255.255.255.0  192.168.4.1
    ip = wifi.ap.getip()
    print(ip)
    -- 192.168.4.1
    ip, nm = wifi.ap.getip()
    print(nm)
    -- 255.255.255.0
```

####Смотрите также
**-**   [wifi.ap.getmac()](#wifi_ap_getmac)


**-** [Содержание](#index)


## wifi.ap.setip()
####Описание
Устанавливает ip адрес, маску, шлюз по умолчанию для точки доступа

####Синтаксис
wifi.ap.setip(cfg)

####Параметры
cfg: lua таблица параметров<br />
```lua
{
  "ip":"192.168.1.1",
  "netmask":"255.255.255.0",
  "gateway":"192.168.1.1"
}
```

####Возвращаемые значения
true успех, false если ошибка

####Пример

```lua
  cfg =
  {
    "ip":"192.168.1.1",
    "netmask":"255.255.255.0",
    "gateway":"192.168.1.1"
  }
  wifi.ap.setip(cfg)

```

####Смотрите также
**-**   [wifi.ap.setmac()](#wifi_ap_setmac)

**-** [Содержание](#index)


## wifi.ap.getmac()
####Описание
Позволяет получить MAC адрес в режиме точки доступа

####Синтаксис
wifi.ap.getmac()

####Параметры
nil

####Возвращаемые значения
mac адрес как строка, например:"1A-33-44-FE-55-BB"

####Пример

```lua
    wifi.ap.getmac()
```

####Смотрите также
**-**   [wifi.ap.getip()](#wifi_ap_getip)

**-** [Содержание](#index)


## wifi.ap.setmac()
####Описание
Позволяет задать MAC адрес в режиме точки доступа

####Синтаксис
wifi.ap.setmac(mac)

####Параметры
mac адрес, строка байт, например:"\024\024\024\024\024\024"

####Возвращаемые значения
true если успех, false если ошибка

####Пример
```lua
    print(wifi.ap.setmac("\024\024\024\024\024\024"))
```

####Смотрите также
**-**   [wifi.ap.setip()](#wifi_ap_setip)

**-** [Содержание](#index)


## wifi.ap.getbroadcast()
####Описание
Позволяет получить broadcast адрес в режиме точки доступа

####Синтаксис
wifi.ap.getbroadcast()

####Параметры
nil


####Возвращаемые значения
broadcast адрес как строка, например:"192.168.0.255"<br />
возвращает nil если ip = "0.0.0.0".

####Пример

```lua
    bc = wifi.ap.getbroadcast()
    print(bc)
    -- 192.168.0.255

```

####Смотрите также
**-**   [wifi.ap.getip()](#wifi_ap_getip)


**-** [Содержание](#index)

#timer


## tmr.delay()
####Описание
Задержка в микросекундах

####Синтаксис
tmr.delay(us)

####Параметры
us: задержка в микросекундах

####Возвращаемые значения
nil

####Пример

```lua
    -- delay 100us
    tmr.delay(100)
```

####Смотрите также
**-**   [tmr.now()](#tmrnow)


**-** [Содержание](#index)


## tmr.now()
####Описание
возвращает текущее значение счетчика времени: uint31, в микросекундах

####Синтаксис
tmr.now()

####Параметры
nil

####Возвращаемые значения
uint31: значение в микросекундах

####Пример

```lua
    -- print current value of counter
    print(tmr.now())
```

####Смотрите также
**-**   [tmr.delay()](#tmrdelay)


**-** [Содержание](#index)


## tmr.alarm()
####Описание
Задает выполнение функции по расписанию

####Синтаксис
tmr.alarm(id, interval, repeat, function do())

####Параметры
id: 0~6, идентификатор события
Interval: время в микросекундах<br />
repeat: 0 - однократное выполнение, 1 - многократное выполнение<br />
function do(): выполняемая функция

####Возвращаемые значения
nil

####Пример

```lua
    -- print "hello world" every 1000ms
    tmr.alarm(0, 1000, 1, function() print("hello world") end )
```

####Смотрите также
**-**   [tmr.now()](#tmrnow)


**-** [Содержание](#index)


## tmr.stop()
####Описание

Отмена выполнения функции по расписанию<br />

####Синтаксис
tmr.stop(id)

####Параметры
id: 0~6, идентификатор события

####Возвращаемые значения
nil

####Пример

```lua
    -- print "hello world" every 1000ms
    tmr.alarm(1, 1000, 1, function() print("hello world") end )

    -- something else

    -- stop alarm
    tmr.stop(1)
```

####Смотрите также
**-**   [tmr.now()](#tmrnow)


**-** [Содержание](#index)


## tmr.wdclr()
####Описание
Сброс системного сторожевого таймера<br />

####Синтаксис
tmr.wdclr()

####Параметры
nil.

####Возвращаемые значения
nil

####Пример

```lua
    for i=1,10000 do 
      print(i)
      tmr.wdclr()   -- should call tmr.wdclr() in a long loop to avoid hardware reset caused by watchdog.
    end 
```

####Смотрите также
**-**   [tmr.delay()](#tmrdelay)

**-** [Содержание](#index)


## tmr.time()
####Описание
Возвращает значение часов реального времени с момента запуска чипа в секундах, uint31 <br />

####Синтаксис
tmr.time()

####Параметры
nil.

####Возвращаемые значения
number - значение в секундах

####Пример

####Смотрите также
**-**   [tmr.now()](#tmrnow)

**-** [Содержание](#index)


#GPIO module
##CONSTANT
gpio.OUTPUT, gpio.INPUT, gpio.INT, gpio.HIGH, gpio.LOW


## gpio.mode()
####Описание
Переключение GPIO на вход/выход, управление внутренним подтягивающим резистором

####Синтаксис
gpio.mode(pin, mode, pullup)

####Параметры
pin: 0~12, IO индекс из таблицы в начале этого руководства<br />
mode: gpio.OUTPUT или gpio.INPUT, или gpio.INT(interrupt mode)
pullup: gpio.PULLUP or gpio.FLOAT, default: gpio.FLOAT.

####Возвращаемые значения
nil

####Пример

```lua
    -- set gpio 0 as output.
    gpio.mode(0, gpio.OUTPUT)

```

####Смотрите также
**-**   [gpio.read()](#gpioread)


**-** [Содержание](#index)


## gpio.read()
####Описание
Чтение состояния GPIO

####Синтаксис
gpio.read(pin)

####Параметры
pin: 0~12, IO индекс из таблицы в начале этого руководства

####Возвращаемые значения
number:0 - низкий уровень, 1 - высокий

####Пример

```lua
    -- read value of gpio 0.
    gpio.read(0)
```

####Смотрите также
**-**   [gpio.mode()](#gpiomode)


**-** [Содержание](#index)


## gpio.write()
####Описание
Установка состояния GPIO

####Синтаксис
gpio.write(pin)

####Параметры
pin: 0~12, IO индекс из таблицы в начале этого руководства<br />
level: gpio.HIGH or gpio.LOW

####Возвращаемые значения
nil

####Пример

```lua
    -- set pin index 1 to GPIO mode, and set the pin to high.
    pin=1
    gpio.mode(pin, gpio.OUTPUT)
    gpio.write(pin, gpio.HIGH)
```

####Смотрите также
**-**   [gpio.mode()](#gpiomode)<br />
**-**   [gpio.read()](#gpioread)


**-** [Содержание](#index)


## gpio.trig()
####Описание
Назначение функции, выполняемой при изменении состояния GPIO

####Синтаксис
gpio.trig(pin, type, function(level))

####Параметры
pin: **1~12**, IO индекс из таблицы в начале этого руководства, пин D0 не поддерживает прерывания<br />
type: "up", "down", "both", "low", "high", соответственно передний фронт, задний фронт, оба, низкий уровень, высокий уровень<br />
function(level): вызываемой функции передается состояние GPIO как параметр.

####Возвращаемые значения
nil

####Пример

```lua
    -- use pin 0 as the input pulse width counter
    pulse1 = 0
    du = 0
    gpio.mode(1,gpio.INT)
    function pin1cb(level)
     du = tmr.now() – pulse1
     print(du)
     pulse1 = tmr.now()
     if level == 1 then gpio.trig(1, "down") else gpio.trig(1, "up") end
    end
    gpio.trig(1, "down",pin1cb)

```

####Смотрите также
**-**   [gpio.mode()](#gpiomode)<br />
**-**   [gpio.write()](#gpiowrite)

**-** [Содержание](#index)


#PWM module


## pwm.setup()
####Описание
Задает ШИМ на GPIO. Только 3 пина могут находится в состоянии ШИМ

####Синтаксис
pwm.setup(pin, clock, duty)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства<br />
clock: 1~1000, частота ШИМ<br />
duty: 0~1023, ШИМ коэффициент заполнения, максимально 1023(10бит)

####Возвращаемые значения
nil

####Пример

```lua
    -- set pin index 1 as pwm output, frequency is 100Hz, duty cycle is half.
    pwm.setup(1, 100, 512)
```

####Смотрите также
**-**   [pwm.start()](#pwmstart)


**-** [Содержание](#index)


## pwm.close()
####Описание
Отключение режима ШИМ для GPIO

####Синтаксис
pwm.close(pin)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства

####Возвращаемые значения
nil

####Пример

```lua
    pwm.close(1)
```

####Смотрите также
**-**   [pwm.start()](#pwmstart)


**-** [Содержание](#index)


## pwm.start()
####Описание
Включение режима ШИМ для GPIO

####Синтаксис
pwm.start(pin)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства

####Возвращаемые значения
nil

####Пример

```lua
    pwm.start(1)
```

####Смотрите также
**-**   [pwm.stop()](#pwmstop)


**-** [Содержание](#index)


## pwm.stop()
####Описание
Приостановка ШИМ для GPIO

####Синтаксис
pwm.stop(pin)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства

####Возвращаемые значения
nil

####Пример

```lua
    pwm.stop(1)
```

####Смотрите также
**-**   [pwm.start()](#pwmstart)


**-** [Содержание](#index)


## pwm.setclock()
####Описание

Задание частоты ШИМ<br />
**-Примечание:** Доступна только одна частота для чипа, при изменении на одном из пинов происходит синхронное изменение и на остальных

####Синтаксис
pwm.setclock(pin, clock)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства<br />
clock: 1~1000, частота ШИМ

####Возвращаемые значения
nil

####Пример

```lua
    pwm.setclock(1, 100)
```

####Смотрите также
**-**   [pwm.getclock()](#pwmgetclock)


**-** [Содержание](#index)


## pwm.getclock()
####Описание
Получение текущей частоты ШИМ

####Синтаксис
pwm.getclock(pin)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства

####Возвращаемые значения
number: частота ШИМ

####Пример

```lua
    print(pwm.getclock(1))
```

####Смотрите также
**-**   [pwm.setclock()](#pwmsetclock)


**-** [Содержание](#index)


## pwm.setduty()
####Описание
Установка ШИМ коэффициента заполнения (duty cycle) для GPIO

####Синтаксис
pwm.setduty(pin, duty)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства<br />
duty: 0~1023, ШИМ коэффициента заполнения (duty cycle), максимально 1023(10bit).

####Возвращаемые значения
nil

####Пример

```lua
    pwm.setduty(1, 512)
```

####Смотрите также
**-**   [pwm.getduty()](#pwmgetduty)


**-** [Содержание](#index)


## pwm.getduty()
####Описание
Получение ШИМ коэффициента заполнения (duty cycle) для GPIO

####Синтаксис
pwm.getduty(pin)

####Параметры
pin: 1~12, IO индекс из таблицы в начале этого руководства

####Возвращаемые значения
number: ШИМ коэффициента заполнения, максимально 1023.

####Пример

```lua
    -- D1 is connected to green led
    -- D2 is connected to blue led
    -- D3 is connected to red led
    pwm.setup(1,500,512)
    pwm.setup(2,500,512)
    pwm.setup(3,500,512)
    pwm.start(1)
    pwm.start(2)
    pwm.start(3)
    function led(r,g,b)
      pwm.setduty(1,g)
      pwm.setduty(2,b)
      pwm.setduty(3,r)
    end
    led(512,0,0) --  set led to red
    led(0,0,512) -- set led to blue.

```

####Смотрите также
**-**   [pwm.setduty()](#pwmsetduty)

**-** [Содержание](#index)


#net
##Константы
net.TCP, net.UDP


## net.createServer()
####Описание
Запускает TCP сервер

####Синтаксис
net.createServer(type, timeout)

####Параметры
type: net.TCP or net.UDP<br />
timeout: для TCP сервера, таймаут 1~28800 сек для отключения неактивных клиентов

####Возвращаемые значения
ссылка на net.server sub module

####Пример

```lua
    net.createServer(net.TCP, 30) -- 30s timeout
```

####Смотрите также
**-** [net.createConnection()](#netcreateconnection)

**-** [Содержание](#index)


## net.createConnection()
####Описание
Запускает TCP клиент

####Синтаксис
net.createConnection(type, secure)

####Параметры
type: net.TCP or net.UDP<br />
secure: 1 or 0, 1 для ssl соединения, 0 для обычного

####Возвращаемые значения
ссылка на net.socket sub module

####Пример

```lua
    net.createConnection(net.UDP, 0)
```

####Смотрите также
**-** [net.createServer()](#netcreateserver)

**-** [Содержание](#index)


#net.server module


## net.server:listen()
####Описание
Задает порт и адрес для входящих подключений на TCP сервере

####Синтаксис
net.server.listen(port,[ip],function(net.socket))

####Параметры
port: порт<br />
ip:ip адрес, как строка (необязательный параметр)<br />
function(net.socket): функция, получающая как параметр сокет при успешном соединении

####Возвращаемые значения
nil

####Пример

```lua
    -- create a server
    sv=net.createServer(net.TCP, 30)    -- 30s time out for a inactive client
    -- server listen on 80, if data received, print data to console, and send "hello world" to remote.
    sv:listen(80,function(c)
      c:on("receive", function(c, pl) print(pl) end)
      c:send("hello world")
      end)
```

####Смотрите также
**-**   [net.createServer()](#netcreateserver)


**-** [Содержание](#index)


## net.server:close()
####Описание
Остановка TCP сервера

####Синтаксис
net.server.close()

####Параметры
nil

####Возвращаемые значения
nil

####Пример

```lua
    -- create a server
    sv=net.createServer(net.TCP, 30)
    -- close server
    sv:close()
```

####Смотрите также
**-**   [net.createServer()](#netcreateserver)

**-** [Содержание](#index)


#net.socket module
## net.socket:connect()
####Описание
Установка соединения с удаленным хостом

####Синтаксис
connect(port, ip/domain)

####Параметры
port: номер порта<br />
ip: ip адрес или доменное имя удаленного хоста

####Возвращаемые значения
nil

####Смотрите также
**-** [net.socket:on()](#netsocketon)
**-** [Содержание](#index)

## net.socket:send()
####Описание
Отправка данных в сокет удаленному хосту

####Синтаксис
send(string, function(sent))

####Параметры
string: данные для отправки<br />
function(sent): вызываемая функция 

####Возвращаемые значения
`nil`

####Смотрите также
**-**   [net.socket:on()](#netsocketon)


**-** [Содержание](#index)


<a id="nk_on"></a>


## net.socket:on()
####Описание
Назначение функции для выполнения по событию

####Синтаксис
on(event, function cb())

####Параметры
`event`: событие, одно из: "connection", "reconnection", "disconnection", "receive", "sent"<br />
`function cb(net.socket, [string])`: функция, первый параметр - сокет<br />
Если событие "receive",  вторым параметром функция получает строку данных, полученных через сокет

####Возвращаемые значения
`nil`

####Пример

```lua
    sk=net.createConnection(net.TCP, 0)
    sk:on("receive", function(sck, c) print(c) end )
    sk:connect(80,"192.168.0.66")
    sk:send("GET / HTTP/1.1\r\nHost: 192.168.0.66\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
```

####Смотрите также
**-**   [net.createServer()](#netcreateserver)


**-** [Содержание](#index)


<a id="nk_close"></a>


## net.socket:close()
####Описание
Закрытие сокета

####Синтаксис
close()

####Параметры
nil

####Возвращаемые значения
nil

####Смотрите также
**-**   [net.createServer()](#netcreateserver)


**-** [Содержание](#index)


## net.socket:dns()
####Описание
Получение IP адреса хоста по доменному имени

####Синтаксис
dns(domain, function(net.socket, ip))

####Параметры
domain: доменное имя, например "www.esp8266.ru"<br />
function (net.socket, ip): вызываемая функция. Первый параметр сокет, второй IP адрес, как строка

####Возвращаемые значения
nil

####Пример

```lua
    sk=net.createConnection(net.TCP, 0)
    sk:dns("www.nodemcu.com",function(conn,ip) print(ip) end)
    sk = nil
```

####Смотрите также
**-**   [net.createServer()](#netcreateserver)

**-** [Содержание](#index)


#i2c module
##Константы
i2c.SLOW,  i2c.TRANSMITTER, i2c. RECEIVER.  FAST（400k） в настоящее время не поддерживается


## i2c.setup()
####Описание
Инициализация i2c.

####Синтаксис
i2c.setup(id, pinSDA, pinSCL, speed)

####Параметры
id = 0<br />
pinSDA: 1~12, IO index<br />
pinSCL: 1~12, IO index<br />
speed:  i2c.SLOW

####Возвращаемые значения
speed: установленная скорость.

####Смотрите также
**-**   [i2c.read()](#i2cread)


**-** [Содержание](#index)


## i2c.start()
####Описание
Старт i2c 

####Синтаксис
i2c.start(id)

####Параметры
id = 0

####Возвращаемые значения
nil

####Смотрите также
**-**   [i2c.read()](#i2cread)


**-** [Содержание](#index)


## i2c.stop()
####Описание
Остановка i2c

####Синтаксис
i2c.stop(id)

####Параметры
id = 0

####Возвращаемые значения
nil

####Смотрите также
**-**   [i2c.read()](#i2cread)


**-** [Содержание](#index)


## i2c.address()
####Описание
Установка i2c адреса и направления

####Синтаксис
i2c.address(id, device_addr, direction)

####Параметры
id=0<br />
device_addr: адрес устройства<br />
direction: i2c.TRANSMITTER для передачи , i2c.RECEIVER лоя приема

####Возвращаемые значения
true: ответ получен
false: ответ не получен

####Смотрите также
**-**   [i2c.read()](#i2cread)

**-** [Содержание](#index)


## i2c.write()
####Описание
Передача данных по to i2c, данные могут состоять из нескольких чисел, строк или таблицы lua

####Синтаксис
i2c.write(id, data1, data2,...)

####Параметры
id=0<br />
data: данные могут состоять из нескольких чисел, строк или таблицы lua

####Возвращаемые значения
number: количество переданных байт

####Пример

```lua
    i2c.write(0, "hello", "world")
```

####Смотрите также
**-**   [i2c.read()](#i2cread)


**-** [Содержание](#index)


## i2c.read()
####Описание
Чтение данных по i2c 

####Синтаксис
i2c.read(id, len)

####Параметры
id=0<br />
len: длинна данных

####Возвращаемые значения
string:data received.

####Пример

```lua
    id=0
    sda=1
    scl=2

    -- initialize i2c, set pin1 as sda, set pin2 as scl
    i2c.setup(id,sda,scl,i2c.SLOW)

    -- user defined function: read from reg_addr content of dev_addr
    function read_reg(dev_addr, reg_addr)
      i2c.start(id)
      i2c.address(id, dev_addr ,i2c.TRANSMITTER)
      i2c.write(id,reg_addr)
      i2c.stop(id)
      i2c.start(id)
      i2c.address(id, dev_addr,i2c.RECEIVER)
      c=i2c.read(id,1)
      i2c.stop(id)
      return c
    end

    -- get content of register 0xAA of device 0x77
    reg = read_reg(0x77, 0xAA)
    print(string.byte(reg))

```

####Смотрите также
**-**   [i2c.write()](#i2cwrite)

**-** [Содержание](#index)


#adc АЦП
##Константы
нет


## adc.read()
####Описание
Чтение данных АЦП по id, esp8266 имеет только один АЦП 10bit adc, id=0, pin TOUT

####Синтаксис
adc.read(id)

####Параметры
id = 0

####Возвращаемые значения
значение АЦП

####Смотрите также
**-**   []()

**-** [Содержание](#index)


#uart


##Константы
нет


## uart.setup()
####Описание
Устанавливает параметры последовательного порта: скорость, биты данных, четности, стоп-бит и эхо.

####Синтаксис
uart.setup( id, baud, databits, parity, stopbits, echo )

####Параметры
id = 0, поддерживается только один последжовательный порт.<br />
baud = 300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 74880, 115200, 230400, 256000, 260800, 921600, 1843200, 3686400 .<br />
databits = 5, 6, 7, 8. <br />
parity = 0(none).<br />
stopbits = 1(1 stopbit), 2(2 stopbit).<br />
echo = 0

####Возвращаемые значения
baud.

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## uart.on()
####Описание
Позволяет задать функцию, вызываемую по событиям последовательного порта

####Синтаксис
uart.on(method, [number/end_char], [function], [run_input])

####Параметры
method = "data", событие: получение данных<br />
number/end_char: размер буфера приема n<255, функция будет вызвана, когда будет получено n байт <br />
Если n=0, функция будет вызываться после получения каждого байта<br />
Если задан не числовой параметр, а симовол  "c", функция будет вызвана, когда будет получен символ "c", или когда будет получено max n=255 байт<br />
function: вызываемая функция, которой передаются принятые данные в качестве параметра, при получении данных (наступлении события "data"): function(data) end<br />
run_input: 0 или 1, 0: данные не будут переданы lua интерпретатору, можно использовать для приема бинарных данных<br />
1: данные передаются на выполнение lua интерпретатору.

####Возвращаемые значения
nil

####Пример

```lua
    -- when 4 chars is received.
    uart.on("data", 4, 
      function(data)
        print("receive from uart:", data)
        if data=="quit" then 
          uart.on("data") 
        end        
    end, 0)
    -- when '\r' is received.
    uart.on("data", "\r", 
      function(data)
        print("receive from uart:", data)
        if data=="quit\r" then 
          uart.on("data") 
        end        
    end, 0)
```

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## uart.write()
####Описание
Передача строк(и) в последовательный порт

####Синтаксис
uart.write( id, string1, string2... )

####Параметры
id = 0, поддерживается только один последовательный порт<br />
string1..n: строка для передачи

####Возвращаемые значения
nil

####Смотрите также
**-**   []()

**-** [Содержание](#index)


#onewire 


##Константы
none


## ow.setup()
####Описание
set a pin in onewire mode.<br />

####Синтаксис
ow.setup(pin)

####Параметры
pin: 1~12, IO index<br />

####Возвращаемые значения
nil

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.reset()
####Описание
Perform a 1-Wire reset cycle. <br />

####Синтаксис
ow.reset(pin)

####Параметры
pin: 1~12, IO index<br />

####Возвращаемые значения
number: Returns 1 if a device responds with a presence pulse.  Returns 0 if there is no device or the bus is shorted or otherwise held low for more than 250uS

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.skip()
####Описание
Issue a 1-Wire rom skip command, to address all on bus. <br />

####Синтаксис
ow.skip(pin)

####Параметры
pin: 1~12, IO index<br />

####Возвращаемые значения
nil

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.select()
####Описание
Issue a 1-Wire rom select command, make sure you do the ow.reset(pin) first. <br />

####Синтаксис
ow.select(pin, rom)

####Параметры
pin: 1~12, IO index<br />
rom: string value, len 8, rom code of the salve device

####Возвращаемые значения
nil

####Пример
```lua
-- 18b20 Example
pin = 9
ow.setup(pin)
count = 0
repeat
  count = count + 1
  addr = ow.reset_search(pin)
  addr = ow.search(pin)
  tmr.wdclr()
until((addr ~= nil) or (count > 100))
if (addr == nil) then
  print("No more addresses.")
else
  print(addr:byte(1,8))
  crc = ow.crc8(string.sub(addr,1,7))
  if (crc == addr:byte(8)) then
    if ((addr:byte(1) == 0x10) or (addr:byte(1) == 0x28)) then
      print("Device is a DS18S20 family device.")
        repeat
          ow.reset(pin)
          ow.select(pin, addr)
          ow.write(pin, 0x44, 1)
          tmr.delay(1000000)
          present = ow.reset(pin)
          ow.select(pin, addr)
          ow.write(pin,0xBE,1)
          print("P="..present)  
          data = nil
          data = string.char(ow.read(pin))
          for i = 1, 8 do
            data = data .. string.char(ow.read(pin))
          end
          print(data:byte(1,9))
          crc = ow.crc8(string.sub(data,1,8))
          print("CRC="..crc)
          if (crc == data:byte(9)) then
             t = (data:byte(1) + data:byte(2) * 256) * 625
             t1 = t / 10000
             t2 = t % 10000
             print("Temperature="..t1.."."..t2.."Centigrade")
          end                   
          tmr.wdclr()
        until false
    else
      print("Device family is not recognized.")
    end
  else
    print("CRC is not valid!")
  end
end
```

####Смотрите также
**-**   []()



**-** [Содержание](#index)


## ow.write()
####Описание
Write a byte. If 'power' is 1 then the wire is held high at the end for parasitically powered devices. You are responsible for eventually depowering it by calling depower() or doing another read or write. <br />

####Синтаксис
ow.write(pin, v, power)

####Параметры
pin:  1~12, IO index <br />
v:  byte to be written to salve device <br />
power:  1 for wire being held high for parasitically powered devices.

####Возвращаемые значения
nil

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.write_bytes()
####Описание
Write multi bytes. If 'power' is 1 then the wire is held high at the end for parasitically powered devices. You are responsible for eventually depowering it by calling depower() or doing another read or write. <br />

####Синтаксис
ow.write_bytes(pin, buf, power)

####Параметры
pin:  1~12, IO index <br />
buf:  string to be written to salve device <br />
power:  1 for wire being held high for parasitically powered devices.

####Возвращаемые значения
nil

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.read()
####Описание
read a byte.  <br />

####Синтаксис
ow.read(pin)

####Параметры
pin:  1~12, IO index <br />

####Возвращаемые значения
byte read from slave device.

####Пример

####Смотрите также
**-**   []()



**-** [Содержание](#index)


## ow.read_bytes()
####Описание
read multi bytes. <br />

####Синтаксис
ow.read_bytes(pin, size)

####Параметры
pin:  1~12, IO index <br />
size:  number of bytes to be read from slave device.<br />

####Возвращаемые значения
string: bytes read from slave device.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.depower()
####Описание
Stop forcing power onto the bus. You only need to do this if you used the 'power' flag to ow.write() or used a ow.write_bytes() and aren't about to do another read or write.<br />

####Синтаксис
ow.depower(pin)

####Параметры
pin:  1~12, IO index <br />

####Пример

####Возвращаемые значения
nil

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.reset_search()
####Описание
Clear the search state so that it will start from the beginning again.<br />

####Синтаксис
ow.reset_search(pin)

####Параметры
pin:  1~12, IO index <br />

####Возвращаемые значения
nil

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.target_search()
####Описание
Setup the search to find the device type 'family_code' on the next call to ow.search() if it is present.<br />

####Синтаксис
ow.target_search(pin, family_code)

####Параметры
pin:  1~12, IO index <br />
family_code:  byte for family code.

####Возвращаемые значения
nil

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.search()
####Описание
Look for the next device. <br />

####Синтаксис
ow.search(pin)

####Параметры
pin:  1~12, IO index <br />

####Возвращаемые значения
if succeed return a string length of 8, which contain the rom code of slave device. <br />
if failed in searching next device return nil.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.crc8()
####Описание
Compute a Dallas Semiconductor 8 bit CRC, these are used in the ROM and scratchpad registers. <br />

####Синтаксис
ow.crc8(buf)

####Параметры
buf: string value, data to be calculated check sum in string. <br />

####Возвращаемые значения
crc result in byte.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.check_crc16()
####Описание
Compute the 1-Wire CRC16 and compare it against the received CRC. <br />

####Синтаксис
ow.check_crc16(buf, inverted_crc0, inverted_crc1, crc)

####Параметры
buf: string value, data to be calculated check sum in string. <br />
inverted_crc0:  LSB of received CRC. <br />
inverted_crc1:  MSB of received CRC. <br />
crc:  crc starting value (optional)

####Возвращаемые значения
bool: true, if the CRC matches; false for dismatches.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## ow.crc16()
####Описание
Compute a Dallas Semiconductor 16 bit CRC.  This is required to check the integrity of data received from many 1-Wire devices.  Note that the CRC computed here is **not** what you'll get from the 1-Wire network, for two reasons:<br />
    1) The CRC is transmitted bitwise inverted.<br />
    2) Depending on the endian-ness of your processor, the binary representation of the two-byte return value may have a different byte order than the two bytes you get from 1-Wire. <br />

####Синтаксис
ow.crc16(buf, crc)

####Параметры
buf:  string value, data to be calculated check sum in string. <br />
crc:  crc starting value (optional)

####Возвращаемые значения
return The CRC16, as defined by Dallas Semiconductor.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


#bit module


##CONSTANT
none


## bit.bnot()
####Описание
Bitwise negation, equivalent to ~value in C.<br />

####Синтаксис
bit.bnot(value)

####Параметры
value: the number to negate.

####Возвращаемые значения
number: the bitwise negated value of the number.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## bit.band()
####Описание
Bitwise AND, equivalent to val1 & val2 & ... & valn in C.<br />

####Синтаксис
bit.band(val1, val2, ... valn)

####Параметры
val1: first AND argument.<br />
val2: second AND argument.<br />
valn: nth AND argument.

####Возвращаемые значения
number: the bitwise AND of all the arguments.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.bor()
####Описание
Bitwise OR, equivalent to val1 | val2 | ... | valn in C.<br />

####Синтаксис
bit.bor(val1, val2, ... valn)

####Параметры
val1: first OR argument.<br />
val2: second OR argument.<br />
valn: nth OR argument.

####Возвращаемые значения
number: the bitwise OR of all the arguments.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.bxor()
####Описание
Bitwise XOR, equivalent to val1 ^ val2 ^ ... ^ valn in C.<br />

####Синтаксис
bit.bxor(val1, val2, ... valn)

####Параметры
val1: first XOR argument.<br />
val2: second XOR argument.<br />
valn: nth XOR argument.

####Возвращаемые значения
number: the bitwise XOR of all the arguments.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.lshift()
####Описание
Left-shift a number, equivalent to value << shift in C.<br />

####Синтаксис
bit.lshift(value, shift)

####Параметры
value: the value to shift.<br />
shift: positions to shift.

####Возвращаемые значения
number: the number shifted left

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## bit.rshift()
####Описание
Logical right shift a number, equivalent to ( unsigned )value >> shift in C.<br />

####Синтаксис
bit.rshift(value, shift)

####Параметры
value: the value to shift.<br />
shift: positions to shift.

####Возвращаемые значения
number: the number shifted right (logically).

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.arshift()
####Описание
Arithmetic right shift a number equivalent to value >> shift in C.<br />

####Синтаксис
bit.arshift(value, shift)

####Параметры
value: the value to shift.<br />
shift: positions to shift.

####Возвращаемые значения
number: the number shifted right (arithmetically).

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.bit()
####Описание
Generate a number with a 1 bit (used for mask generation). Equivalent to 1 << position in C.<br />

####Синтаксис
bit.bit(position)

####Параметры
position: position of the bit that will be set to 1.

####Возвращаемые значения
number: a number with only one 1 bit at position (the rest are set to 0).

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.set()
####Описание
Set bits in a number.<br />

####Синтаксис
bit.set(value, pos1, pos2, ..., posn)

####Параметры
value: the base number.<br />
pos1: position of the first bit to set.<br />
pos2: position of the second bit to set.<br />
posn: position of the nth bit to set.

####Возвращаемые значения
number: the number with the bit(s) set in the given position(s).

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.clear()
####Описание
Clear bits in a number.<br />

####Синтаксис
bit.clear(value, pos1, pos2, ..., posn)

####Параметры
value: the base number.<br />
pos1: position of the first bit to clear.<br />
pos2: position of the second bit to clear.<br />
posn: position of thet nth bit to clear.

####Возвращаемые значения
number: the number with the bit(s) cleared in the given position(s).

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.isset()
####Описание
Test if a given bit is set.<br />

####Синтаксис
bit.isset(value, position)

####Параметры
value: the value to test.<br />
position: bit position to test.

####Возвращаемые значения
boolean: true if the bit at the given position is 1, false otherwise.

####Пример

####Смотрите также
**-**   []()


**-** [Содержание](#index)


## bit.isclear()
####Описание
Test if a given bit is cleared.<br />

####Синтаксис
bit.isclear(value, position)

####Параметры
value: the value to test.<br />
position: bit position to test.

####Возвращаемые значения
boolean: true if the bit at the given position is 0, false othewise.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)

#spi module
##CONSTANT
MASTER, SLAVE, CPHA_LOW, CPHA_HIGH, CPOL_LOW, CPOL_HIGH, DATABITS_8, DATABITS_16


## spi.setup()
####Описание
setup spi configuration.<br />

####Синтаксис
spi.setup( id, mode, cpol, cpha, databits, clock )

####Параметры
id: spi id number.<br />
mode: MASTER or SLAVE(not supported yet).<br />
cpol: CPOL_LOW or CPOL_HIGH, clock polarity.<br />
cpha: CPHA_HIGH or CPHA_LOW, clock phase.<br />
databits: DATABITS_8 or DATABITS_16.<br />
clock: spi clock (not supported yet).

####Возвращаемые значения
number: 1.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## spi.send()
####Описание
send data to spi.<br />

####Синтаксис
wrote = spi.send( id, data1, [data2], ..., [datan] )

####Параметры
id: spi id number.<br />
data: data can be either a string, a table or an 8-bit number

####Возвращаемые значения
number: bytes writen count.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## spi.recv()
####Описание
recv data from spi.<br />

####Синтаксис
read = spi.recv( id, size )

####Параметры
id: spi id number.<br />
size: data size want to read.

####Возвращаемые значения
string: string bytes read from spi.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)

#mqtt module
##CONSTANT


## mqtt.Client()
####Описание
Create a MQTT client.
The client adheres to version 3.1.1 of the MQTT protocol, make sure that your broker supports and is correctly configured for version 3.1.1 of the MQTT protocol. The client is incompatible with brokers running version 3.1 of the MQTT protocol.


####Синтаксис
mqtt.Client(clientid, keepalive, user, pass)

####Параметры
clientid: the client id.<br />
keepalive: keepalive second, a number.<br />
user: user name, a string.<br />
pass: user password, a string.

####Возвращаемые значения
mqtt client.

####Пример
```lua
-- init mqtt client with keepalive timer 120sec
m = mqtt.Client("clientid", 120, "user", "password")

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline" 
-- to topic "/lwt" if client don't send keepalive packet
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)

-- on publish message receive event
m:on("message", function(conn, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
  end
end)

-- for secure: m:connect("192.168.11.118", 1880, 1)
m:connect("192.168.11.118", 1880, 0, function(conn) print("connected") end)

-- subscribe topic with qos = 0
m:subscribe("/topic",0, function(conn) print("subscribe success") end)

-- publish a message with data = hello, QoS = 0, retain = 0
m:publish("/topic","hello",0,0, function(conn) print("sent") end)

m:close();
-- you can call m:connect again
```
####Смотрите также
**-**   []()

**-** [Содержание](#index)

#mqtt client module


## mqtt.client:lwt()
####Описание
setup Last Will and Testament (optional)<br />
Broker will publish a message with qos = 0, retain = 0, data = "offline" <br />
to topic "/lwt" if client don't send keepalive packet.

####Синтаксис
mqtt:lwt(topic, message, qos, retain)

####Параметры
topic: the topic to publish to, String.<br />
message: the message to publish, Buffer or String.<br />
qos: qos level, default 0.<br />
retain: retain flag, default 0.

####Возвращаемые значения
nil.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)

## mqtt.client:connect()
####Описание
Connects to the broker specified by the given host, port, and secure options

####Синтаксис
mqtt:connect( host, port, secure, function(client) )

####Параметры
host: host domain or ip, string.<br />
port: number, broker port.<br />
secure: 0 or 1, default 0.<br />
function(client): when connected, call this function.

####Возвращаемые значения
nil.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## mqtt.client:close()
####Описание
close connection to the broker.

####Синтаксис
mqtt:close()

####Параметры
nil

####Возвращаемые значения
nil.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## mqtt.client:publish()
####Описание
Publish a message

####Синтаксис
mqtt:publish( topic, payload, qos, retain, function(client) )

####Параметры
topic: the topic to publish to, string<br />
message: the message to publish, string<br />
qos: qos level, default 0<br />
retain: retain flag, default 0<br />
function(client): callback fired when PUBACK received.<br />

####Возвращаемые значения
nil.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## mqtt.client:subscribe()
####Описание
Subscribe to a topic or topics

####Синтаксис
mqtt:subscribe(topic, qos, function(client, topic, message))

####Параметры
topic: a string topic to subscribe to<br />
qos: qos subscription level, default 0<br />
function(client, topic, message): callback fired when message received.<br />

####Возвращаемые значения
nil.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)


## mqtt.client:on()
####Описание
register callback function to event.

####Синтаксис
mqtt:on(event, function(client, [topic], [message]))

####Параметры
event: string, which can be: "connect", "message", "offline"<br />
function cb(client, [topic], [message]): callback function. The first param is the client.<br />
If event is "message",  the 2nd and 3rd param are received topic and message in string.

####Возвращаемые значения
nil.

####Пример

####Смотрите также
**-**   []()

**-** [Содержание](#index)