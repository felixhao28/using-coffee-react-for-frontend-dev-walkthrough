# Developing frontend with Coffee&React

Written on Aug/4/2015.

A brief walkthrough on working with Coffee&React

## Libraries

* jQuery
    - jquery: meh
    - jquery-form: easier to upload files
* ReactJS
    - react: a reactive DOM framework
    - react-bootstrap: bootstrap components in React
    - react-router: routing for React
        + react-router-bootstrap: Link components for some bootstrap components
    - react-slider: Slider for React
    - react-loader: Spinning loader for React
    - react-d3-components: d3 charts for React
* Utilities
    - D3.js: data driven HTML (usually for data visualization)
        + NVD3: Reusable charts for d3.js
    - moment: time formating/localization
    - numeral: number/currency formating/localization
    - soundmanager2: HTML5 sound loading, playing control

## Developing Tools

* CoffeeScript: http://coffeescript.org/
    - coffee-script: CoffeeScript => JavaScript
* GruntJS
    - grunt: task runner, mainly for build automation
    - grunt-cli: install **globally** for invoking grunt
    - grunt-contrib-coffee: *coffee* task
    - grunt-coffee-react: CJSX/CoffeeScript => JavaScript task
    - grunt-newer: helper for incremental builds
    - grunt-contrib-watch: watch for changes to rebuild
    - grunt-webpack: *webpack* task
    - load-grunt-tasks: easier to load grunt tasks dependencies
* Webpack
    - webpack: pack web resources (JS, CSS, HTML), uses chained loaders to load raw resources (e.g. cjsx-loader=>coffee-loader, sass-loader=>css-loader=>style-loader). Styles are loaded as scripts dynamically injected when needed. Supports CommonJS/AMD.
    - webpack-dev-server: http server for webpack hot reloading
    - react-hot-loader: react hot reloading support
    - cjsx-loader: CJSX => CoffeeScript loader
    - coffee-loader: CoffeeScript => JS loader
    - jsx-loader: JSX => JS loader
    - css-loader: CSS => style loader
    - style-loader: style => JS loader
    - exports-loader: add `module.exports` to modularize JS library.
    - imports-loader: use global variables inside a module
    - expose-loader: leak global variables from modules to `window` object
* Sass
    - node-sass: SASS/SCSS => CSS compiler
    - sass-loader: SASS/SCSS => CSS loader for webpack
    - grunt-sass: SASS/SCSS => CSS grunt task
* Utilities
    - express: simple http server
    - npm: meh
    - NodeJS: meh

## Dev Workflow in a Nutshell

* Items: (See example project)
    - Source files:
        + CoffeeScript (.coffee, .cjsx)
        + HTML (.html)
        + SASS (.sass, .scss)
    - Dependencies:
        + NPM packages (node_modules\\*)
        + browser packages (assets\\*.js)

![in a nutshell](https://raw.githubusercontent.com/felixhao28/using-coffee-react-for-frontend-dev-walkthrough/master/nutshell.png)

(**Why no bower?**: using two package managers is confusing)

* Manual (via CLI)
    - Compile CJSX (`npm install -g coffee-react`)
        + `cjsx -cb something.cjsx` will produce `something.js`
    - Compile Sass (`npm install -g node-sass`)
        + `node-sass --output-style compressed a.sass b.sass`
* Grunt Automation: make for JS
    - Compile CJSX (`npm install grunt-coffee-react`)
        + cjsx task
    - Compile Sass (`npm install grunt-sass`)
        + sass task
    - Automatic incremental build
        + `npm install grunt-contrib-watch grunt-newer`
        + watch task
    - See `gruntfile.coffee` for example
* Webpack Automation:
    - Compile CJSX
        + `npm install cjsx-loader coffee-loader coffee-script jsx-loader`
    - Compile Sass
        + `npm install sass-loader css-loader style-loader`
    - Automatic incremental build
        + use `watch: true` and `keepalive: true`
    - See `webpack.config.coffee` for example

## Full Walkthrough

1. Create `package.json`
    Run `npm init` to create a `package.json` in the root folder. It maintains all the NPM dependencies. Follow the instructions of `npm`. Entry point is irrelevant.
2. Create source files
    Create the following files:
    * index.html
    * app.coffee
    * server.coffee
    * src (folder)
        - App.cjsx
        - App.sass
        - index.coffee
    See example project for file contents.
3. Create `gruntfile.coffee`
    Create `gruntfile.coffee`. See example project for file contents.
4. Create `webpack.config.coffee` & `webpack.production.config.coffee`
    Create `webpack.config.coffee` and `webpack.production.config.coffee`. See example project for file contents.
5. Install dependencies
    Run `npm install --save jquery react react-bootstrap react-router`
    Run `npm install -g grunt-cli coffee-script`
    Run `npm install --save-dev grunt load-grunt-tasks grunt-webpack grunt-load webpack webpack-dev-server react-hot-loader coffee-loader cjsx-loader jsx-loader css-loader style-loader exports-loader imports-loader expose-loader node-sass sass-loader grunt-sass`
    Check if the dependencies in your `package.json` looks the same as the `package.json` in example project.
6. Run dev-server (for hot reloading and incremental watch)
    Run `coffee server.coffee`
7. Bundle up for production
    Run `grunt dist`
8. See in action
    Run `coffee app.coffee` then go to http://localhost:3000