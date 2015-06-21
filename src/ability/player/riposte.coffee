BaseAbility = require './base'

class Riposte extends BaseAbility
    name: "Riposte"
    tint: 0x0000FF
    icon: 'sword'
    constructor: ->
        super()
        @power = 1.2
        @text = "If enemy's next action is an attack, take no damage and return
        #{@power * 100}% of the attack's damage."
    action: ->
        game.player.riposte = @

module.exports = Riposte