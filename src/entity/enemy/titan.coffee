BaseEnemy = require './base'
breakNodes = require '../../ability/enemy/break_node'
baseAttack = require '../../ability/enemy/attack'

class Titan extends BaseEnemy
    constructor: ->
        super()
        @name = "Titan"
        @hp = 150
        @atk = 10
        @turn = 0
        @actionQueue.push @getNextAction()
    getNextAction: ->
        @turn++
        boost = false
        if @turn is 5
            print 'boosted attack coming up! next action'
        if @turn > 5
            boost = true
            print 'boosted attack! action'
            @atk *= 3
        return baseAttack
    endTurn: ->
        super()
        @atk = 10

module.exports = Titan