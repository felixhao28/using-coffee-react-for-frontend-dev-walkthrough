webpack = require("webpack")
WebpackDevServer = require("webpack-dev-server")
config = require("./webpack.config.coffee")

new WebpackDevServer webpack(config),
  publicPath: config.output.publicPath,
  hot: true,
  historyApiFallback: true
.listen 3000, (err, result) ->
  console.log(err) if (err)
  console.log('Listening at 3000');