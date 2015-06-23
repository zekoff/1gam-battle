BaseAbility = require './base'
enemyAttack = require '../enemy/attack'

class Feint extends BaseAbility
    name: "Feint"
    tint: 0xFFFFFF
    icon: 'sword'
    constructor: ->
        super()
        @power = 1
        @text = "Do #{@power} damage and provoke the enemy to attack on its
        next turn."
    action: ->
        game.enemy.receiveDamage @power
        game.enemy.actionQueue.unshift ->
            enemyAttack()
            game.enemy.actionQueue.shift()

module.exports = Feint