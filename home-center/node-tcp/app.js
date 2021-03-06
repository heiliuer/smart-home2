/**
 * Created by Administrator on 2016/11/17.
 */
require("./DateFormater")
var sendTcp = require("./index")


var args = process.argv.splice(2);

var PORT = 5369;

try {
    PORT = args.length && args[0];
} catch (e) {
}
PORT = PORT || 5369;


var WebSocketServer = require('websocket').server;
var express = require('express');
var app = express();
var server = app.listen(PORT);
var wsServer = new WebSocketServer({httpServer: server, autoAcceptConnections: false});

// this will make Express serve your static files
app.use(express.static(__dirname + '/www'));

//代理
var request_m = require('request');


function originIsAllowed(origin) {
    // put logic here to detect whether the specified origin is allowed.
    return true;
}

var connections = []


wsServer.on('request', function (request) {
    if (!originIsAllowed(request.origin)) {
        request.reject();
        console.log((new Date()) + ' Connection from origin ' + request.origin + ' rejected.');
        return;
    }
    var connection = request.accept('echo-protocol', request.origin);

    if (connections.indexOf(connection) == -1) {
        connections.push(connection)
    }


    // connection.send(JSON.stringify({type: "comments"}))


    console.log((new Date().format("yyyy-MM-dd hh:mm:ss")) + ' Peer ' + connection.remoteAddress + ' connected.');


    //console.log((new Date()) + ' Connection accepted.');
    connection.on('message', function (message) {
        if (message.type === 'utf8') {
            sendTcp(message.utf8Data)
        } else {
            console.log('Received non-utf8Data Message: ' + message);
        }


    });
    connection.on('close', function (reasonCode, description) {
    });
})