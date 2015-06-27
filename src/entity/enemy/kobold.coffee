BaseEnemy = require './base'
BasicAbilities = require '../../ability/enemy/basic_abilities'
Attack = require '../../ability/enemy/attack'
Heal = require '../../ability/enemy/heal'

class Kobold extends BaseEnemy
    constructor: ->
        super()
        @name = "Kobold"
        @hp = 200
        @atk = 18
    getNextAction: ->
        chance = game.rnd.frac()
        if chance < .2
            return new Heal()
        else
            return new Attack()

module.exports = Kobold