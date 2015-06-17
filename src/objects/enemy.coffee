class Enemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
        @atk = 10
        @turn = 0
    act: ->
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
        tempAtk *= .5 if game.player.blocking
        game.player.blocking = false
        game.player.hp -= tempAtk

module.exports = Enemy