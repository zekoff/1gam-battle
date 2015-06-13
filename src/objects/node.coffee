GraphUtils = require '../util/graph_utils'
NodeInput = require '../util/node_input'
Popup = require './popup'

fieldData = require '../data/field'
playerData = require '../data/player'

class Node extends Phaser.Sprite
    
    # Fields
    _children: null
    _onscreen: false
    edge: null # edge back to parent
    ability: null
    popup: null
    
    # Public methods
    constructor: (x = 0, y = 0, type = 'circle')->
        super game, x, y, type
        @anchor.set 0.5
        @inputEnabled = true
        @edge = game.add.sprite x, y, 'line'
        @edge.scale.set 4
        @edge.tint = 0x00FF00
        @events.onInputUp.add NodeInput.advanceNodes.bind @
        switch game.rnd.between 0, 2
            when 0
                @ability =
                    action: ->
                        print 'did 10 damage'
                        fieldData.enemyHp -= 10
                    name: 'Attack'
                    text: 'Perform a basic attack for 10 damage.'
                @tint = 0xFF0000
            when 1
                @ability =
                    action: ->
                        playerData.blocking = true
                        print '50% block'
                    name: 'Block'
                    text: "Cause the enemy's next attack to do half damage."
                @tint = 0x0000FF
            when 2
                @ability =
                    action: ->
                        playerData.hp += 10
                        if playerData.hp > 100
                            playerData.hp = 100
                        print 'healed 10 hp'
                    name: 'Heal'
                    text: "Heal yourself for 10 HP."
                @tint = 0x00FF00
        @events.onInputOver.add =>
            @popup = new Popup
            @popup.x = 4
            @popup.y = 496
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