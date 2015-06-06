Utils = require '../util/graph_utils'

class Node extends Phaser.Sprite
    
    # Fields
    _upper: null
    _lower: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        @anchor.set 0.5
        @inputEnabled = true
        @events.onInputUp.add =>
            @tint = 0x00FF00
            field.setAll 'onscreen', false
            @createChildren 3
            # add all reachable nodes to field
            @onscreen = true
            for n in @getChildren 3
                field.add n
                n.onscreen = true
            # remove everything not reachable from @
            field.forEach (child) ->
                child.kill() if not child.onscreen
            field.arrangeNodes [@]

    createChildren: (depth = 1) ->
        depth--
        if @_upper is null
            @_upper = new Node
        if @_lower is null
            @_lower = new Node
        @_upper.createChildren(depth) if depth > 0
        @_lower.createChildren(depth) if depth > 0

    getChildren: (depth = 1, children = []) ->
        depth--
        children.push @_upper, @_lower
        if depth > 0
            @_upper.getChildren(depth, children)
            @_lower.getChildren(depth, children)
        return children

module.exports = Node