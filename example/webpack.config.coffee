webpack = require("webpack")
path = require("path")

module.exports =
  cache: true
  entry: [
    "webpack-dev-server/client?http://localhost:3000", # WebpackDevServer host and port
    "webpack/hot/only-dev-server",
    "./src/index" # Main app"s entry point
  ],
  output:
    path: path.join(__dirname, "assets")
    filename: "bundle.js"
    publicPath: "/assets/"
  debug: true,
  resolve:
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
    modulesDirectories: ["src", "node_modules"]
  module:
    loaders: [
      # required to write "require("./style.css")"
        test: /\.css$/
        loader: "style-loader!css-loader"
      ,
        test: /\.(scss|sass)$/
        # use sourceMap because a bug: https://github.com/webpack/css-loader/issues/84
        loader: "style-loader!css-loader!sass-loader?sourceMap&includePaths[]=" + path.resolve(__dirname, "./node_modules")
      ,

      # required for bootstrap icons
        test: /\.(woff|woff2)$/
        loader: "url-loader?prefix=font/&limit=5000&mimetype=application/font-woff"
      ,
        test: /\.ttf$/
        loader: "file-loader?prefix=font/"
      ,
        test: /\.eot$/
        loader: "file-loader?prefix=font/"
      ,
        test: /\.svg$/
        loader: "file-loader?prefix=font/"
      ,
        test: require.resolve("jquery")
        loader: "expose?$"
      ,
        test: require.resolve("jquery")
        loader: "expose?jQuery"
      ,
        test: require.resolve("react")
        loader: "expose?React"
      ,
        test: /\.jsx$/
        loaders: ["react-hot", "jsx-loader?insertPragma=React.DOM"]
        include: path.join(__dirname, "src")
      ,
        test: /\.(cjsx|coffee)$/
        loaders: ["react-hot", "coffee", "cjsx"]
        include: path.join(__dirname, "src")
    ]
  plugins: [
    new webpack.HotModuleReplacementPlugin()
    new webpack.NoErrorsPlugin()
    new webpack.IgnorePlugin(/vertx/) # https://github.com/webpack/webpack/issues/353
    new webpack.ProvidePlugin
      # Automatically detect jQuery and $ as free var in modules
      # and inject the jquery library
      # This is required by many jquery plugins
      jQuery: "jquery"
      $: "jquery"
      React: "react/addons"
  ]
  watch: true
  keepalive: true