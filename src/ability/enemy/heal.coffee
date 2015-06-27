BaseEnemyAbility = require './base'

class EnemyHeal extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Heal"
    action: ->
        game.enemy.hp += 30

module.exports = EnemyHeal