BaseAbility = require './base'

class MageArmor extends BaseAbility
    name: "Mage Armor"
    tint: 0xaaaacc
    icon: null
    constructor: ->
        @power = .3
        @text = "Add #{@power*100}% to magic armor.
        Decreases damage taken, plus chance to reflect attack
        and destroy itself."
    action: ->
        game.player.mageArmor += @power

module.exports = MageArmor