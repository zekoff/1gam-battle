Popup = require './popup'

HP_TEXT_STYLE =
    font: 'sans-serif'
    fontSize: 24
    fill: 'black'

class Hud extends Phaser.Group
    STANCE_HIGH: 45
    STANCE_LOW: 340
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
        @enemyActions = game.add.group()
        @stanceIndicator = game.add.image 583, (@STANCE_LOW - @STANCE_HIGH) / 2 + @STANCE_HIGH, 'circle'
        @stanceIndicator.inputEnabled = true
        @stanceIndicator.events.onInputOver.add ->
            @popup = new Popup 400, 300
            @popup.setHeading game.player.getStanceInfo().name
            @popup.setText game.player.getStanceInfo().description
        @stanceIndicator.events.onInputOut.add ->
            @popup.destroy()
    update: ->
        @playerHp.setText "#{game.player.name} HP: #{game.player.hp}"
        @enemyHp.setText "#{game.enemy.name} HP: #{game.enemy.hp}"

module.exports = Hud