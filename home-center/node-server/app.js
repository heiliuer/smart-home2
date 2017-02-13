/**
 * Created by heiliuer on 2017/2/9.
 */
var mosca = require('mosca');

var ascoltatore = {
    //using ascoltatore
    type: 'mongo',
    url: 'mongodb://localhost:27017/mqtt',
    pubsubCollection: 'ascoltatori',
    mongo: {}
};

var settings = {
    port: 1883,
    backend: ascoltatore
};

var server = new mosca.Server(settings);


var httpServices = require("./http_services");


server.on('clientConnected', function (client) {
    console.log('client connected', client.id);
});

// fired when a message is received
server.on('published', function (packet, client) {
    console.log('Published', packet.payload);
    console.log(packet)
});

server.on('ready', setup);

// fired when the mqtt server is ready
function setup() {
    console.log('Mosca server is up and running');

    // setInterval(function () {
    //     var message = {
    //         topic: '/hello/world',
    //         payload: 'message' + new Date().getTime(), // or a Buffer
    //         qos: 0, // 0, 1, or 2
    //         retain: false // or true
    //     };
    //
    //     server.publish(message, function () {
    //         console.log('done!');
    //     });
    // }, 4000)

    httpServices.setSendMessage(function (msg) {
        var message = {
            topic: '/switcher',
            payload: msg, // or a Buffer
            qos: 0, // 0, 1, or 2
            retain: false // or true
        };

        server.publish(message, function () {
            console.log('done!');
        });
    })
}