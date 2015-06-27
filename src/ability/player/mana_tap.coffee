BaseAbility = require './base'

class ManaTap extends BaseAbility
    name: "Mana Tap"
    tint: 0xaaaacc
    icon: null
    constructor: ->
        @power = 10
        @text = "The next three spellcasts will heal you for #{@power}."
    action: ->
        for node in game.field.root.getChildren 3
            node.edgeEffect =
                activate: =>
                    game.player.hp += @power
                    game.player.hp = 100 if game.player.hp > 100
            node.edge.tint = 0x00ff00

module.exports = ManaTap