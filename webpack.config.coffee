webpack = require("webpack")
path = require("path")
SCSS_LOADER = "style-loader!css-loader!sass-loader?sourceMap&includePaths[]=" + path.resolve(__dirname, "./node_modules")

module.exports =
  entry:
    app: "./src/index"
  output:
    path: path.resolve(__dirname, "./assets/")
    filename: "bundle.js"
    publicPath: "./assets/"
  resolve:
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
    modulesDirectories: ["src", "node_modules"]
  module:
    loaders: [
      # required to write "require('./style.css')"
        test: /\.css$/,
        loader: "style-loader!css-loader"
      ,
        test: /\.(scss|sass)$/
        loader: SCSS_LOADER
      ,
        test: /\.jsx$/
        loader: "jsx-loader?insertPragma=React.DOM"
      ,
        test: /\.(cjsx|coffee)$/
        loaders: ["coffee", "cjsx"]
    ]
