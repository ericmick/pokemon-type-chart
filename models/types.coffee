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

module.exports = (name, type) ->
    pokemon = []
    if name
        pokemon = pokedex.filter (p) -> 
            new RegExp('^' + name + '$', 'i').test p.name
    if type
        regex = new RegExp('^' + type + '$', 'i')
        pokemon = pokedex.filter (p) ->
            p.type.any (t) -> regex.test t
    if pokemon
        pokemon = pokemon.map (p) ->
            type = p.type.map (t) ->
                name: t.toLowerCase()
                index: types.findIndex((x) -> x.name == t.toLowerCase())
            name: p.name.toLowerCase(),
            type: type,
            eff: getEff(type)
    {types: types, pokemon: pokemon ? []}