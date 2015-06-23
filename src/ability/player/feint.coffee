BaseAbility = require './base'
EnemyAttack = require '../enemy/attack'

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
        game.enemy.actionQueue.unshift new EnemyAttack

module.exports = Feint