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

var clientStatus = []
var clientStatusIndex = {}

function addAndRefreshClientStatus(packet, client) {
    var topic = packet.topic;
    var newStatus = {
        value: "" + packet.payload,
        topic: topic,
    }
    if (topic in clientStatusIndex) {
        clientStatus[clientStatusIndex[topic]] = newStatus;
    } else {
        clientStatus.push(newStatus);
        clientStatusIndex[topic] = clientStatus.length - 1
    }
}

function getclientStatusTopic(topic) {
    if (topic in clientStatusIndex) {
        return clientStatus[clientStatusIndex[topic]];
    }
    return null;
}

httpServices.setOnConnect(function (connection) {
    clientStatus.forEach(function (status) {
        connection.send(JSON.stringify(status));
    })
})

server.on('clientConnected', function (client) {
    console.log('client connected', client.id);
});


server.on('clientDisconnected', function (client) {
    console.log('client disconnected', client.id);
});

// fired when a message is received
server.on('published', function (packet, client) {
    addAndRefreshClientStatus(packet, client);
    var value = "" + packet.payload;
    console.log('Published', value);
    console.log(packet)
    var data = {
        topic: packet.topic,
        value: value
    }
    httpServices.sendMessage(data);

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

    httpServices.setSendMessage(function (data) {
        // console.log(data)
        // var data = {
        //     topic: device.topic,
        //     value: device.value
        // }
        if (typeof data == "string") {
            data = JSON.parse(data);
        }
        var message = {
            topic: data.topic,
            payload: data.value, // or a Buffer
            qos: 0, // 0, 1, or 2
            retain: false // or true
        };

        server.publish(message, function () {
            // console.log('done!');
        });
    })
}