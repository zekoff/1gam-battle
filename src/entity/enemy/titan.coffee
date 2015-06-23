BaseEnemy = require './base'
BasicAbilities = require '../../ability/enemy/basic_abilities'

class Titan extends BaseEnemy
    constructor: ->
        super()
        @name = "Titan"
        @hp = 150
        @atk = 10
        @turn = 0
        @actionQueue.push @getNextAction()
    getNextAction: ->
        if game.rnd.between(0, 4) is 1
            return BasicAbilities.breakNodes.bind @, 3
        @turn++
        boost = false
        if @turn is 5
            print 'boosted attack coming up! next action'
        if @turn > 5
            boost = true
            print 'boosted attack! action'
            @atk *= 3
            turn = 0
        return BasicAbilities.attack.bind @
    endTurn: ->
        super()
        @atk = 10

module.exports = Titan