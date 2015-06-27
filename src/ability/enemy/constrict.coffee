BaseEnemyAbility = require './base'

class Constrict extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Constrict"
    action: ->
        for node in game.field.root.getChildren()
            node.tint = 0x000000
            node.broken = true
            node.icon.alpha = 0.5

module.exports = Constrict