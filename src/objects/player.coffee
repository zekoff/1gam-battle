fieldData = require '../data/field'

class Player extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
    act: ->
        fieldData.player.hp -= 10

module.exports = Player