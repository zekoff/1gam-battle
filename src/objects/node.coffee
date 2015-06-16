GraphUtils = require '../util/graph_utils'
NodeInput = require '../util/node_input'
Popup = require './popup'

abilityList = [
    require '../ability/attack'
    require '../ability/defend'
    require '../ability/heal'
]

class Node extends Phaser.Sprite
    
    # Fields
    _children: null
    edge: null # edge back to parent
    ability: null
    popup: null
    icon: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        game.field.nodes.add @
        @anchor.set 0.5
        @inputEnabled = true
        @ability = new (game.rnd.pick abilityList)
        @edge = game.make.sprite x, y, 'line'
        game.field.edges.add @edge
        @edge.scale.set 2
        @edge.tint = 0x404040
        @icon = game.make.sprite x, y, @ability.icon
        @icon.anchor.set 0.5
        game.field.icons.add @icon
        @tint = @ability.tint
        @events.onInputUp.add NodeInput.advanceNodes.bind @
        @events.onInputOver.add =>
            @popup = new Popup
            @popup.x = 254
            @popup.y = 304
            @popup.setHeading @ability.name
            @popup.setText @ability.text
        @events.onInputOut.add =>
            @popup.destroy()

    addChild: (child) ->
        if @_children is null
            @_children = []
        @_children.push child

    ###
    Randomly create children for this node. The `depth` parameter specifies
    how many tiers of children to create. `1` would be the node's immediate
    children, and is the default. `2` would create the node's immediate children
    and then their immediate children, etc.
    ###
    createChildren: (depth = 1) ->
        if @_children is null
            @_children = []
            @_children.push(new Node @x, @y) for [0..game.rnd.between(0,2)]
        for child in @_children
            child.createChildren(depth - 1) if depth > 1

    ###
    Get the children of this node. The `depth` parameter specifies how far down
    to traverse the graph of child nodes. `1` gets only the node's immediate
    children. `2` gets the immediate children and their children, etc.
    ###
    getChildren: (depth = 1, children = []) ->
        children.push @_children...
        if depth > 1
            child.getChildren(depth - 1, children) for child in @_children
        return children

module.exports = Node