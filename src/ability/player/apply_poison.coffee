BaseAbility = require './base'

class ApplyPoison extends BaseAbility
    name: 'Apply Poison'
    tint: 0xFF0000
    icon: 'poison'
    constructor: ->
        @power = 10
        @text = "Apply poison to a dagger and set up sneak attack. Poison does
        #{@power} damage and HP leech."
    action: ->
        for node in game.field.root.getChildren()
            node.edge.tint = 0xee4040
            node.edgeEffect =
                activate: =>
                    game.enemy.receiveDamage @power
                    game.player.hp += @power
                    game.player.hp = 100 if game.player.hp > 100

module.exports = ApplyPoison