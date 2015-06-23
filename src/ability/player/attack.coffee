BaseAbility = require './base'

class Attack extends BaseAbility
    name: 'Attack'
    tint: 0xFF0000
    icon: 'sword'
    constructor: ->
        @power = 10
        @text = "Perform a basic attack for #{@power} damage."
    action: ->
        game.enemy.receiveDamage @power

module.exports = Attack