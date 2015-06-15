class Background extends Phaser.Group
    constructor: ->
        super game
        @pattern = game.make.tileSprite 0, 0, 800, 600, 'pattern'
        @add @pattern
        @screen = game.make.image 0, 0, 'line'
        @add @screen
        @screen.width = 800
        @screen.height = 600
        @screen.alpha = 0.2
        @screen.tint = 0x0000FF

module.exports = Background