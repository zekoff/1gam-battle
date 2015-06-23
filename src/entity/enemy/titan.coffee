BaseEnemy = require './base'
BasicAbilities = require '../../ability/enemy/basic_abilities'
Attack = require '../../ability/enemy/attack'
GroundPound = require '../../ability/enemy/ground_pound'

class Titan extends BaseEnemy
    constructor: ->
        super()
        @name = "Titan"
        @hp = 150
        @atk = 10
        @turn = 0
        @actionQueue.push new Attack
        @actionQueue.push new Attack
    getNextAction: ->
        if game.rnd.frac() < .2
            return new GroundPound()
        return new Attack()
    endTurn: ->
        super()
        @atk = 10

module.exports = Titan