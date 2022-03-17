import { WebSocket } from 'ws';

const server = new WebSocket.Server({ port: 8080 });

function connection_handler(connection: WebSocket) {
    connection.on("message", (event) => {
        console.log("Received: '%s'", event.toString());
        connection.send("ECHO: " + event.toString());
    });
};

server.on("connection", connection_handler);
