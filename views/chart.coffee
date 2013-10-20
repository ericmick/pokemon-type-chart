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
        div 'class': 'controls', ->
            form action: '/', ->
                input placeholder: 'pokemon', name: 'name'
                button 'pokemon'
            form action: '/', ->
                input placeholder: 'type', name: 'type'
                button 'type'
            form action: '/all', -> button 'all pokémon'
            form action: '/types', -> button 'all types'
            form action: '/', -> button 'clear'
        h1 'pokémon type chart'
        a 'class': 'help', ->
            div 'class': 'help', ->
                div "Figure out how effective any attack will be by looking on the row of the attack type and the column of the defending pokémon's type."
                div "This chart represents generation VI, Pokémon X & Y. Effectiveness and pokémon types are different in other games."
                div "Use the controls in the top-right corner to find specific pokémon or combination types."
                div "There are no icons for generation VI pokémon, yet."
                div "Effectiveness shown here is just the first step in calculating damage. Factors such as attack and defense stats, STAB and abilities are also important. STAB (same type attack bonus) means that when the attack type matches the type of the attacker there is an additional 1.5× effectiveness multiplier."
            span '[?]'
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
                        if this.pokemon.length > 0
                            th 'class': 'spacer'
                        this.pokemon.each (pokemon) ->
                            th ->
                                if pokemon.image
                                    img src: '/img/' + pokemon.index + '.png', width: 32, height: 32
                                span pokemon.name
                                pokemon.type.each (type) -> 
                                    div 'class': type.name, trim type.name
                        th 'class': 'corner', 'attack'
                this.types.each (type, typeIndex, types) ->
                    tr ->
                        th ->
                            div 'class': type.name, trim type.name
                        type.eff.each (eff, i) ->
                            td 'class': 'eff' + eff, -> 
                                eff + '×'
                        if this.pokemon.length > 0
                            td 'class': 'spacer'
                        this.pokemon.each (p) ->
                            td 'class': 'eff' + p.eff[typeIndex], -> p.eff[typeIndex] + '×'
                        th ->
                            div 'class': type.name, trim type.name