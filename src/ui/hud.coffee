fieldData = require '../data/field'

HP_TEXT_STYLE =
    font: 'sans-serif'
    fontSize: 24
    fill: 'black'

class Hud extends Phaser.Group
    constructor: ->
        super game
        @screen = game.make.image 0, 0, 'hud_mask'
        @add @screen
        @screen.inputEnabled = true
        @screen.input.pixelPerfectClick = true
        @screen.input.pixelPerfectOver = true
        @playerHp = game.make.text 20, 500, "", HP_TEXT_STYLE
        @add @playerHp
        @enemyHp = game.make.text 400, 500, "", HP_TEXT_STYLE
        @add @enemyHp
    update: ->
        # update hp text
        @playerHp.setText "Player HP: #{fieldData.player.hp}"
        @enemyHp.setText "Enemy HP: #{fieldData.enemy.hp}"

module.exports = Hud