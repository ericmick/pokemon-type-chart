borderRadius = (radius) ->
    WebkitBorderRadius: radius
    MozBorderRadius: radius
    borderRadius: radius

module.exports =
    body:
        backgroundColor: '#FFF'
        color: '#333'
    'table#guide':
        position: 'absolute'
        backgroundColor: '#FFF'
        borderRight: '1px solid #DDD'
    'div.chart':
        width: '100%'
        overflowX: 'auto'
    'table.chart':
        tableLayout: 'fixed'
        borderSpacing: 0
        borderCollapse: 'collapse'
        'thead th':
            verticalAlign: 'bottom'
        th:
            fontFamily: "Tahoma, Geneva, sans-serif"
            fontSize: '9px'
            fontWeight: '300'
            width: '35px'
            div:
                border: '1px solid #666'
                padding: '2px'
                margin: '2px 0'
                color: '#FFF'
                textShadow: '1px 1px #000'
                mixin: borderRadius '6px'
            'div.normal':
                backgroundColor: '#A8A878'
            'div.fighting':
                backgroundColor: '#C03028'
            'div.flying':
                backgroundColor: '#A890F0'
            'div.poison':
                backgroundColor: '#A040A0'
            'div.ground':
                backgroundColor: '#E0C068'
            'div.rock':
                backgroundColor: '#B8A038'
            'div.bug':
                backgroundColor: '#A8B820'
            'div.ghost':
                backgroundColor: '#705898'
            'div.steel':
                backgroundColor: '#B8B8D0'
            'div.fire':
                backgroundColor: '#F08030'
            'div.water':
                backgroundColor: '#6890F0'
            'div.grass':
                backgroundColor: '#78C850'
            'div.electric':
                backgroundColor: '#F8D030'
            'div.psychic':
                backgroundColor: '#F85888'
            'div.ice':
                backgroundColor: '#98D8D8'
            'div.dragon':
                backgroundColor: '#7038F8'
            'div.dark':
                backgroundColor: '#705848'
            'div.fairy':
                backgroundColor: '#EE99AC'
        'th.corner':
            padding: 0
        td:
            textAlign: 'center'
            fontSize: '10px'
            border: '1px solid #DDD'
            width: '32px'
        'td.eff4':
            backgroundColor: '#EE1'
            color: '#553'
        'td.eff2':
            backgroundColor: '#1C1'
            color: '#DED'
        'td.eff1':
            backgroundColor: '#FFF'
            color: '#333'
        'td.eff½':
            backgroundColor: '#E11'
            color: '#EDD'
        'td.eff¼':
            backgroundColor: '#611'
            color: '#DCC'
        'td.eff0':
            backgroundColor: '#000'
            color: '#DDD'