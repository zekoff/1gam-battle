BaseEnemyAbility = require './base'

class Leech extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Leech"
    action: ->
        game.player.receiveDamage 5
        game.enemy.hp += 5

module.exports = Leech