class Node extends Phaser.Sprite
    
    # Fields
    _upper: null
    _lower: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        @anchor.set 0.5
        @inputEnabled = true
        @events.onInputUp.add ->
            console.log 'clicked'
    createChildren: (depth = 1) ->
        depth--
        if @_upper is null
            @_upper = new Node
            @_upper.createChildren(depth) if depth > 0
        if @_lower is null
            @_lower = new Node
            @_lower.createChildren(depth) if depth > 0
    getChildren: (depth = 1, children = []) ->
        depth--
        children.push @_upper, @_lower
        if depth > 0
            @_upper.getChildren(depth, children)
            @_lower.getChildren(depth, children)
        return children
        
module.exports = Node