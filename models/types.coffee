sugar = require 'sugar'
pokedex = require './../data/pokedex.json'
types = require './../data/types.json'

toChar = (multiplier) ->
    switch multiplier
        when .5 then '½'
        when .25 then '¼'
        else multiplier.toString()

getEff = (type) ->
    result = ''
    types.each (moveType) ->
        multiplier = 1
        type.each (t) ->
            eff = moveType.eff[t.index]
            eff = 0.5 if eff == '½'
            multiplier *= eff
        result += toChar(multiplier)
    result

downloadImages = () ->
    fs = require 'fs'
    http = require 'http'
    pokedex.each (pokemon) ->
        if pokemon.image
            http.get pokemon.image, (response) ->
                response.pipe fs.createWriteStream 'assets/img/' + pokemon.nationalIndex + '.png'

module.exports = (name, type, unique) ->
    pokemon = [];
    if name
        pokemon = pokemon.union pokedex.filter (p) -> 
            new RegExp(name, 'i').test p.name
    if type
        if type.has '/'
            combo = (type.split '/').map (t) -> new RegExp '^' + t + '$', 'i'
            pokemon = pokemon.union pokedex.filter (p) ->
                combo.all (r) -> p.type.any (t) -> r.test t
        else
            regex = new RegExp('^' + type + '$', 'i')
            pokemon = pokemon.union pokedex.filter (p) ->
                p.type.any (t) -> regex.test t
    if unique
        pokemon = pokemon.unique (p) -> p.type.join '/'
        typeGroups = {}
        pokemon.groupBy(
            (p) ->
                types.findIndex (t) -> 
                    t.name == p.type[0]?.toLowerCase()
            , (key, group) ->
                typeGroups[key] = group.sortBy (x) ->
                    types.findIndex (t) ->
                        t.name == x.type[1]?.toLowerCase()
            )
        pokemon = Object.values(typeGroups).flatten()
    pokemon = pokemon.map (p) ->
        type = p.type.map (t) ->
            name: t.toLowerCase()
            index: types.findIndex((x) -> x.name == t.toLowerCase())
        name: p.name.toLowerCase(),
        type: type,
        eff: getEff(type)
        image: !!p.image
        index: p.index
    {types: types, pokemon: pokemon}