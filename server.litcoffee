This server is mean, stupid, and evil. It will do nothing useful but
echo and disconnect.

    require('colors')
    WebSocketServer = require('ws').Server
    port = parseInt(process.argv[2] or 9000)

    counter = 0

    wss = new WebSocketServer port: port

    wss.on 'error', (error) ->
      if error
        console.error "#{error}".red

Sockety goodness. Or badness, as the case may be.

    wss.on 'connection', (socket) ->
      console.log 'client connected'.blue

Translate messages into events allowing declarative event handling.

      socket.on 'message', (req) ->
        console.log req.green
        if counter++ % 2
          socket.close()
        else
          socket.send(req)

    console.log 'listening on', "#{port}".blue
    console.log 'ready to waffle'.rainbow
