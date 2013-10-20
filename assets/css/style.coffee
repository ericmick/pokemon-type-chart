types = require './../../data/types.json'

borderRadius = (radius) ->
    WebkitBorderRadius: radius
    MozBorderRadius: radius
    borderRadius: radius

smallFont =
    fontFamily: "Tahoma, Geneva, sans-serif"
    fontSize: '9px'
    fontWeight: '300'

style =
    body:
        backgroundColor: '#FFF'
        color: '#333'
        mixin: smallFont
    h1:
        display: 'inline'
        mixin: smallFont
    'a.help':
        marginLeft: '1em'
        position: 'relative'
        cursor: 'help'
        'div.help':
            display: 'none'
            position: 'absolute'
            marginLeft: '1em'
            backgroundColor: '#FFF'
            border: '1px solid #666'
            padding: '1em'
            fontSize: '10px'
            width: '40em'
            div:
                padding: '1em'
    'a.help:hover div':
        display: 'block'
    'div.controls':
        float: 'right'
    '.controls form':
        display: 'inline'
    '.controls input':
        mixin: smallFont
    '.controls button':
        mixin: smallFont
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
                border: '1px solid #333'
                padding: '2px'
                margin: '2px 0'
                color: '#FFF'
                textShadow: '1px 1px 3px #000'
                mixin: borderRadius '6px'
        'th.corner':
            padding: 0
        td:
            textAlign: 'center'
            fontSize: '10px'
            border: '1px solid #DDD'
            width: '32px'
            cursor: 'default'
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
        'th.spacer':
            width: '1px'
        'td.spacer':
            width: '1px'
            backgroundColor: '#DDD'
            border: '1px solid #DDD'

types.each (type) ->
    style['div.' + type.name] =
        backgroundColor: '#' + type.color

module.exports = style