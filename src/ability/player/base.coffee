class BaseAbility
    name: 'Base Ability'
    tint: 0xFFFFFF
    icon: 'circle'
    constructor: ->
        @power = 0
        @text = "Base ability with #{@power} power."
    action: ->
        print 'Base ability triggered.'
    attachToNode: (node) ->
        node.ability = @
        node.tint = @tint
        @createEdge node
        @createIcon node
    createEdge: (node) ->
        node.edge = game.make.sprite node.x, node.y, 'line'
        game.field.edges.add node.edge
        node.edge.scale.set 2
        node.edge.tint = 0x404040
    createIcon: (node) ->
        node.icon = game.make.sprite node.x, node.y, @icon
        node.icon.anchor.set 0.5
        game.field.icons.add node.icon

module.exports = BaseAbility