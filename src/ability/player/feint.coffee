BaseAbility = require './base'
EnemyAttack = require '../enemy/attack'
Defend = require './defend'

class Feint extends BaseAbility
    name: "Feint"
    tint: 0xFFFFFF
    icon: 'sword'
    constructor: ->
        super()
        @power = 1
        @text = "Do #{@power} damage and provoke the enemy to attack, but take
        half damage."
    action: ->
        game.enemy.receiveDamage @power
        game.enemy.actionQueue.unshift new EnemyAttack
        game.player.blocking = new Defend

module.exports = Feint