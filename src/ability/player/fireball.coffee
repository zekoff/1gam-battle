BaseAbility = require './base'

class Fireball extends BaseAbility
    name: "Fireball"
    tint: 0xff8000
    icon: null
    constructor: ->
        @power = 10        
        @text = "Launch a fireball for #{@power} damage."
    action: ->
        game.enemy.receiveDamage @power

module.exports = Fireball