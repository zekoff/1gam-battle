class Player extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
    act: ->
        game.player.hp -= 10

module.exports = Player