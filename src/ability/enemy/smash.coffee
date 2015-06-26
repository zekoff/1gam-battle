BaseEnemyAbility = require './base'

class Smash extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Smash"
    action: ->
        game.player.receiveDamage @atk * 3

module.exports = Smash