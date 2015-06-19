class Player extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
    endTurn: ->
        @blocking = false

module.exports = Player