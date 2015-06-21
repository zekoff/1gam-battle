BaseAbility = require './base'

class Feint extends BaseAbility
    name: "Feint"
    tint: 0xFFFFFF
    icon: 'sword'
    constructor: ->
        super()
        @power = 1
        @text = "Do #{@power} damage, provoking the enemy to attack on its next
        turn."
    action: ->
        game.enemy.receiveDamage @power
        # Add basic attack AI frame to enemy's AI stack
        game.enemy.ai.push ->
            game.enemy.attack()
            game.enemy.ai.pop()

module.exports = Feint