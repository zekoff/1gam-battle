BaseAbility = require './base'

class Heal extends BaseAbility
    name: 'Heal'
    tint: 0x00FF00
    icon: 'potion'
    constructor: ->
        @power = 20
        @text = "Heal yourself for #{@power} HP."
    action: ->
        game.player.hp += @power
        game.player.hp = 100 if game.player.hp > 100

module.exports = Heal