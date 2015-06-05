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
            print 'creating children'
            @createChildren 3
            # add all reachable nodes to field
            for n in @getChildren 3
                field.add n
            # remove everything not reachable from @
            field.arrangeNodes [@]
    createChildren: (depth = 1) ->
        depth--
        print depth
        if @_upper is null
            print 'new node'
            @_upper = new Node
        if @_lower is null
            print 'new node'
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