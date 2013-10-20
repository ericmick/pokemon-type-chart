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
app.get '/types', (req, res) ->
    res.render 'chart', types '', '.*', true
app.get '/type/:type', (req, res) ->
    console.log 'finding type', req.param('type')?.toLowerCase()
    res.render 'chart', types '', req.param('type')?.toLowerCase()
app.get '/:name', (req, res) ->
    console.log 'finding', req.param('name')?.toLowerCase(), req.param('type')?.toLowerCase()
    res.render 'chart', types(req.param('name')?.toLowerCase(), req.param('type')?.toLowerCase())
app.get '/', (req, res) ->
    console.log 'finding', req.param('name')?.toLowerCase(), req.param('type')?.toLowerCase()
    res.render 'chart', types(req.param('name')?.toLowerCase(), req.param('type')?.toLowerCase())
app.use '/img', express.static __dirname + '/assets/img'
port = process.env.PORT || 80
app.listen port
console.log 'listening on port ' + port