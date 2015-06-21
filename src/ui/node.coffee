GraphUtils = require '../util/graph_utils'
Popup = require './popup'

class Node extends Phaser.Sprite
    constructor: (x = 0, y = 0, type = 'circle') ->
        @_children = []
        super game, x, y, type
        game.field.nodes.add @
        @anchor.set 0.5
        @inputEnabled = true
        @ability = game.player.getRandomAbility()
        @ability.attachToNode @
        @events.onInputUp.add @onActivate, @
        @events.onInputOver.add @onOver, @
        @events.onInputOut.add @onOut, @

    onActivate: ->
        @popup?.destroy()
        GraphUtils.advanceNodes.call @
        game.player.act @ability
        game.enemy.act()
        game.player.endTurn()
        game.enemy.endTurn()

    onOver: ->
        @popup = new Popup 254, 304
        @popup.setHeading @ability.name
        @popup.setText @ability.text

    onOut: ->
        @popup.destroy()

    ###
    Randomly create children for this node. The `depth` parameter specifies
    how many tiers of children to create. `1` would be the node's immediate
    children, and is the default. `2` would create the node's immediate children
    and then their immediate children, etc.
    ###
    createChildren: (depth = 1) ->
        if @_children.length is 0
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