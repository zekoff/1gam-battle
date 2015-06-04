class Node extends Phaser.Sprite
    
    # Fields
    _upper: null
    _lower: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super(game, x, y, type)
        @anchor.set 0.5
    createChildren: ->
        if @_upper is null
            @_upper = new Node
        if @_lower is null
            @_lower = new Node
    getChildren: ->
        return [@_upper, @_lower]
        
module.exports = Node