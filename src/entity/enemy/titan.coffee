BaseEnemy = require './base'
breakNodes = require '../../ability/enemy/break_node'

class Titan extends BaseEnemy
    constructor: ->
        super()
        @name = "Titan"
        @hp = 150
        @atk = 10
        @turn = 0
        @ai.push =>
            @turn++
            boost = false
            if @turn is 5
                print 'boosted attack coming up!'
            if @turn > 5
                boost = true
                print 'boosted attack!'
                @turn = 0
            tempAtk = @atk
            tempAtk *= 3 if boost
            game.player.receiveDamage tempAtk
            breakNodes()

module.exports = Titan