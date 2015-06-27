BaseAbility = require './base'

class Disappear extends BaseAbility
    name: "Disappear"
    tint: 0xFF00FF
    icon: null
    constructor: ->
        super()
        @power = 0
        @text = "Disappear this turn, avoiding any damage but changing to
        Empty stance."
    action: ->
        game.player.disappear = true
        game.player.stance = 0
        game.player.lastStance = "Empty"
        game.player.lastColor = 0x808080
        game.player.stancePower = 0

module.exports = Disappear