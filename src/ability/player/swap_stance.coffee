BaseAbility = require './base'

class StanceSwap extends BaseAbility
    name: "Flow"
    tint: 0x808080
    icon: 'swap_stance'
    constructor: ->
        super()
        @power = 0
        @text = "Instantly swap to the opposing stance."
    action: ->
        if game.player.lastStance is 'Yin'
            game.player.stance = -300
        else
            game.player.stance = 300

module.exports = StanceSwap