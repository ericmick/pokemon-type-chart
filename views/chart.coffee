trim = (type) ->
    switch type
        when 'fighting' then 'fight'
        else type

doctype 5
html ->
    head ->
        title 'pokémon type chart'
        css 'style'
    body ->
        div id: 'chart', 'class': 'chart', ->
            table 'class': 'chart', ->
                thead ->
                    tr -> th colspan: '20', 'defending pokémon'
                    tr ->
                        th 'class': 'corner', ->
                            span 'attack'
                            table id: 'guide', 'class': 'chart', ->
                                this.types.each (type, typeIndex) ->
                                    tr ->
                                        th ->
                                            div 'class': type.name, trim type.name
                        this.types.each (type) ->
                            th ->
                                div 'class': type.name, trim type.name
                        this.pokemon.each (pokemon) ->
                            th ->
                                span pokemon.name
                                pokemon.type.each (type) -> 
                                    div 'class': type.name, type.name
                        th 'class': 'corner', 'attack'
                this.types.each (type, typeIndex) ->
                    tr ->
                        th ->
                            div 'class': type.name, trim type.name
                        type.eff.each (eff) ->
                            td 'class': 'eff' + eff, -> eff + '×'
                        this.pokemon.each (p) ->
                            td 'class': 'eff' + p.eff[typeIndex], -> p.eff[typeIndex] + '×'  
                        th ->
                            div 'class': type.name, trim type.name
        js 'script'