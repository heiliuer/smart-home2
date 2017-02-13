/**
 * Created by Heiliuer on 2017/2/4 0004.
 */
var url = "ws://" + location.hostname + ":" + location.port + "/sync";
var mSocket = new WebSocket(url, "echo-protocol");

var _range = document.querySelector("#range")
var _switch = document.querySelector("#switch")

var timerToSync
_range.oninput = function () {
    var rangeVal = _range.value;
    console.log(rangeVal)
    if (timerToSync) {
        clearTimeout(timerToSync)
    }
    timerToSync = setTimeout(function () {
        mSocket.send(rangeVal)
    }, 5)

}


_switch.onchange = function () {
    var s_checked = _switch.checked;
    console.log(s_checked)
    if (timerToSync) {
        clearTimeout(timerToSync)
    }
    timerToSync = setTimeout(function () {
        mSocket.send("" + (s_checked ? 1 : -1))
    }, 5)
}

mSocket.onopen = function (event) {
    //mSocket.send("亲爱的服务器！我连上你啦！");
};

mSocket.onclose = function () {
    console.log("close");
}

mSocket.onmessage = function (event) {
    console.log("receive:", event.data);
}