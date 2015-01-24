express = require('express')
http = require('http')
socket_io = require('socket.io')

app = express()
app.use(express.static(__dirname + "/public"))
server = http.Server(app)
io = socket_io(server)
io.on 'connection', (socket)->

server.listen(8081)
