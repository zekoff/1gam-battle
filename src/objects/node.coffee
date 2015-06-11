GraphUtils = require '../util/graph_utils'
NodeInput = require '../util/node_input'

class Node extends Phaser.Sprite
    
    # Fields
    _children: null
    _onscreen: false
    edge: null # edge back to parent; set by parent
    ability: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        @anchor.set 0.5
        @inputEnabled = true
        @edge = game.add.sprite 0, 0, 'line'
        @edge.scale.set 4
        @edge.tint = 0x00FF00
        @events.onInputUp.add NodeInput.advanceNodes.bind @
        switch game.rnd.between 0, 2
            when 0
                @ability = ->
                    print 'did 10 damage'
                    window.enemyHp -= 10
                @tint = 0xFF0000
            when 1
                @ability = ->
                    window.blockedLast = true
                    print '50% block'
                @tint = 0x0000FF
            when 2
                @ability = ->
                    window.playerHp += 10
                    if window.playerHp > 100
                        window.playerHp = 100
                    print 'healed 10 hp'
                @tint = 0x00FF00

    addChild: (child) ->
        if @_children is null
            @_children = []
        @_children.push child

    createChildren: (depth = 1) ->
        if @_children is null
            @_children = []
            @_children.push(new Node) for [0..game.rnd.between(0,2)]
        for child in @_children
            child.createChildren(depth - 1) if depth > 1

    getChildren: (depth = 1, children = []) ->
        children.push @_children...
        if depth > 1
            child.getChildren(depth - 1, children) for child in @_children
        return children

module.exports = Node