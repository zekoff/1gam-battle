BaseAbility = require './base'

class Kunai extends BaseAbility
    name: 'Throw Kunai'
    tint: 0xFF0000
    icon: 'kunai'
    constructor: ->
        @power = 5
        @text = "Throw three kunai for #{@power} damage each."
    action: ->
        game.enemy.receiveDamage @power
        game.enemy.receiveDamage @power
        game.enemy.receiveDamage @power

module.exports = Kunai