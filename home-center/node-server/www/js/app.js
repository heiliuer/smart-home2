/**
 * Created by heiliuer on 2016/5/7 0007.
 */
+function (global) {
    var devices = global.DEVICES;

    var devicesIndexs = {}

    devices.forEach(function (device, index) {
        devicesIndexs[device.topic] = index
    })


    var dh11Parser = [{
        "data_index": 1,
        "name": "温度",
        "unit": "℃ "
    }, {
        "data_index": 2,
        "name": "湿度",
        "unit": "% "
    }, {
        "data_index": 4,
        "name": "光强",
        "unit": ""
    }, {
        "data_index": 5,
        "name": "雨水",
        "unit": " ",
        trans: function (value) {
            return (value === "0" ? "有" : (value === "1" ? "无" : false)) || "--"
        }
    },];

    var vm = new Vue({
        el: "#vue-app",
        data: {
            inited: false,
            devices: devices,
            isConnected: false,
            waitEcho: false,
            qrcodeUrl: encodeURI("http://qr.liantu.com/api.php?text=" + location.href),

        },
        methods: {
            parseDh11AndLightData: function (value) {
                var datas = value.split(",");
                return dh11Parser.map(function (parser) {
                    var value = datas[parser.data_index];
                    if (parser.trans) {
                        value = parser.trans(value);
                    }
                    return $.extend(true, {value: value}, parser);
                })
                /*return "温度：" + (datas[1] || "--") + "℃ "
                 + "湿度：" + (datas[2] || "--") + "% <br/>"
                 + "光强：" + (datas[4] || "--") + " "
                 + "雨水：" + parseYushui(datas[5])*/
            },
            change: function (device) {
                console.log("change:", device)
                device.disable = true;
                // console.log(this.status.deskLightOn);
                if (this.isConnected) {
                    if (device.type == "slider") {
                        var data = {
                            topic: device.topic,
                            value: device.value + ""
                        }
                    } else {
                        var data = {
                            topic: device.topic,
                            value: device.value ? "1" : "0"
                        }
                    }

                    socket.send(JSON.stringify(data));
                }
            }
        }
    });

    var socket;

    function openSocket() {
        var host = location.host;
        // var host = location.host;
        // 创建一个Socket实例
        socket = new WebSocket('ws://' + host + "/" + "sync", "echo-protocol");
        // 打开Socket
        socket.onopen = function (event) {
            console.log("isConnected true")
            vm.isConnected = true;

            // 发送一个初始化消息
            //socket.send('I am the client and I\'m listening!');
            // 关闭Socket....
            //socket.close()
            vm.inited = true;
        };

        // 监听消息
        socket.onmessage = function (event) {
            //console.log('Client received a message data ', event.data);
            try {
                var data = JSON.parse(event.data);
                if ("topic" in data) {
                    if (data.topic in devicesIndexs) {
                        var device = vm.devices[devicesIndexs[data.topic]];
                        device.enable = true
                        if (device.type == "switcher") {
                            device.value = data.value == true
                        } else if (device.type == "dh11") {
                            device.value = data.value
                        } else if (device.type == "switcher_readonly") {
                            device.value = data.value == true
                        } else if (device.type == "slider") {
                            device.value = data.value
                        }
                    } else {
                        console.log("未识别的设备数据", data);
                    }


                } else {
                    console.log(event.data, " is invalid format!");
                }
            } catch (e) {
                console.log(e);
            }

        };

        // 监听Socket的关闭
        socket.onclose = function (event) {
            vm.isConnected = false;
            setTimeReOpenSocket();
            console.log('Client notified socket has closed', event);
        };

        socket.onerror = function (event) {
            vm.isConnected = false;
            setTimeReOpenSocket();
            console.log('Client notified socket has errored', event);
        }
    }

    var setTimeReOpenSocket = function () {
        var timer;
        return function () {
            if (timer != null) {
                clearTimeout(timer);
            }
            setTimeout(openSocket, 3000);
        }
    }();

    openSocket();

    // vm.isConnected = true

    $("#vue-app").removeClass("invisiable").fadeIn(300);

    $("#qrcode .weui_btn_dialog").click(function () {
        $("#qrcode").hide()
    });

    $("#qrcode_switcher").click(function () {
        $("#qrcode").show();
    })

    $("#qrcode .info").text(window.location.href);
}(window);


