BaseAbility = require './base'

class Defend extends BaseAbility
    name: 'Defend'
    tint: 0x0000FF
    icon: 'shield'
    constructor: ->
        @power = 0.5
        @text = "Block the next attack to reduce damage by #{@power * 100}%."
    action: ->
        game.player.blocking = @

module.exports = Defend