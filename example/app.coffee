express = require("express")
app = express()
app.use "/static", express.static("static")
app.get "/", (req, res) ->
  res.sendFile(__dirname + "/index.html")
server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port
  console.log("listening at http://%s:%s", host, port)