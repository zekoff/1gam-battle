BaseEnemy = require './base'
BasicAbilities = require '../../ability/enemy/basic_abilities'
Attack = require '../../ability/enemy/attack'
GroundPound = require '../../ability/enemy/ground_pound'
Charge = require '../../ability/enemy/charge_noop'
Smash = require '../../ability/enemy/smash'

class Titan extends BaseEnemy
    constructor: ->
        super()
        @name = "Titan"
        @hp = 300
        @atk = 10
        @turn = 0
        @charging = false
    getNextAction: ->
        if @charging
            @charging = false
            return new Smash()
        chance = game.rnd.frac()
        if chance < .1
            return new GroundPound()
        else if chance < .6
            @charging = true
            return new Charge()
        else
            return new Attack()
    endTurn: ->
        super()

module.exports = Titan