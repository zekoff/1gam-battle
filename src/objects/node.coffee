GraphUtils = require '../util/graph_utils'

class Node extends Phaser.Sprite
    
    # Fields
    _children: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        @anchor.set 0.5
        @inputEnabled = true
        @events.onInputUp.add =>
            @tint = 0x00FF00
            game.world.setAll 'onscreen', false
            @createChildren 3
            # add all reachable nodes to field
            @onscreen = true
            for n in @getChildren 3
                game.world.add n
                n.onscreen = true
            # remove everything not reachable from @
            game.world.forEach (child) ->
                child.kill() if not child.onscreen
            GraphUtils.arrangeNodes [@]

    createChildren: (depth = 1) ->
        depth--
        if @_children is null
            @_children = []
            @_children.push(new Node) for [0..1]
        for child in @_children
            child.createChildren(depth) if depth > 0

    getChildren: (depth = 1, children = []) ->
        depth--
        children.push @_children...
        if depth > 0
            child.getChildren(depth, children) for child in @_children
        return children

module.exports = Node