BaseAbility = require './base'

class MagicMissile extends BaseAbility
    name: "Magic Missiles"
    tint: 0xaaaacc
    icon: 'magic_missile'
    constructor: ->
        @power = 5
        @text = "Launch three magic missiles for #{@power} damage each."
    action: ->
        game.enemy.receiveDamage @power
        game.enemy.receiveDamage @power
        game.enemy.receiveDamage @power

module.exports = MagicMissile