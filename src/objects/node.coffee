GraphUtils = require '../util/graph_utils'
NodeInput = require '../util/node_input'

class Node extends Phaser.Sprite
    
    # Fields
    _children: null
    _onscreen: false
    edge: null # edge back to parent; set by parent
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        @anchor.set 0.5
        @inputEnabled = true
        @edge = game.add.sprite 0, 0, 'line'
        @edge.scale.set 4
        @edge.tint = 0x00FF00
        @events.onInputUp.add NodeInput.advanceNodes.bind @

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