express = require 'express'
assets = require 'connect-assets'
ccss = require 'ccss'
types = require './models/types'
sugar = require 'sugar'

app = express()
app.set 'view engine', 'coffee'
app.engine 'coffee', require('coffeecup').__express
app.use express.logger()
assets.cssCompilers.coffee =
    compileSync: (sourcePath, source, helperContext) ->
        template = require sourcePath
        ccss.compile template
app.use assets()
app.use express.favicon 'assets/img/favicon.ico'
app.get '/all', (req, res) ->
    res.render 'chart', types('.*')
app.get '/type/:type', (req, res) ->
    res.render 'chart', types('', req.route.params.type)
app.get '/:name', (req, res) ->
    console.log 'finding', req.route.params.name
    res.render 'chart', types(req.route.params.name.toLowerCase())
app.get '*', (req, res) ->
    res.render 'chart', types()
app.use express.static __dirname + '/public'
app.listen 80
console.log 'listening: port 80'