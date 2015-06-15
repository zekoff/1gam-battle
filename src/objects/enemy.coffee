fieldData = require '../data/field'

class Enemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
    act: ->
        #debugger
        #print fieldData.player.hp
        #fieldData.player.hp -= 10

module.exports = Enemy