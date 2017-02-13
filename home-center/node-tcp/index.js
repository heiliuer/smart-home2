/**
 * Created by Heiliuer on 2017/2/4 0004.
 */
var net = require('net');


module.exports = function (str) {
    var client = new net.Socket();


    // client.on('data', function (data) {
    //     console.log('Received: ' + data);
    //     try {
    //         client.destroy(); // kill client after server's response
    //     } catch (e) {
    //     }
    // });
    //
    // client.on('close', function () {
    //     console.log('Connection closed');
    // });

    try {
        client.connect(80, '192.168.31.135', function () {
            console.log('Connected');
            client.write(str);
            client.destroy()
        });
    } catch (e) {
    }
}