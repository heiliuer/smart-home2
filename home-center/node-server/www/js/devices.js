/**
 * Created by heiliuer on 2017/3/10 0010.
 */
+function (global) {
    global.DEVICES = [
        /*{
         type: "switcher_readonly",
         name: "在办公",
         icon: "img/icon_desk.png",
         topic: "/switcher_a0:20:a6:00:f8:85",//大板子
         value: true,
         enable: true
         },*/
        {
            type: "switcher",
            name: "主卧顶灯",
            icon: "img/icon_floor.gif",
            topic: "/switcher_a0:20:a6:08:76:dc",
            value: true,
            enable: true
        },
        {
            type: "switcher",
            name: "次卧顶灯",
            icon: "img/icon_floor.gif",
            topic: "/switcher_5c:cf:7f:f0:21:31",
            value: true,
            enable: true
        },
        {
            type: "slider",
            name: "次卧台灯",
            icon: "img/icon_desk.png",
            topic: "/switcher_5c:cf:7f:a2:cc:fe",
            value: true,
            enable: true,
            other: {
                min: 0,
                max: 1023,
                step: 20
            }
        },
        {
            type: "switcher_readonly",
            name: "次卧有人",
            icon: "img/icon_at_house.png",
            topic: "/switcher_a0:20:a6:08:24:e9",
            value: true,
            enable: true
        },
        {
            type: "dh11",
            icon: "img/icon_floor.gif",
            topic: "/switcher_a0:20:a6:16:f6:2c",
            value: "",
            enable: true
        },
    ]
}(window)