BaseEnemyAbility = require './base'

class Poison extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Poison"
    action: ->
        for node in game.field.root.getChildren 3
            node.edge.tint = 0xaa40aa
            node.edgeEffect =
                activate: ->
                    game.player.receiveDamage 4

module.exports = Poison