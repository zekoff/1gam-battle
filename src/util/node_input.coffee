GraphUtils = require './graph_utils'
Popup = require '../ui/popup'

module.exports =
    nodeActivated: ->
        @popup?.destroy()
        game.player.changeStance game.field.root.y - @y
        stanceLocation = (game.player.stance + 300) / 600 # normalized
        stanceLocation = (1 - stanceLocation)
        stanceLocation *= game.field.hud.STANCE_LOW - game.field.hud.STANCE_HIGH
        stanceLocation += game.field.hud.STANCE_HIGH
        game.field.hud.stanceIndicator.y = stanceLocation
        game.field.hud.stanceIndicator.tint = game.player.getStanceInfo().color
        game.player.applyStanceEffect @ability
        GraphUtils.advanceNodes.call @
        delay = game.time.create()
        delay.add 500, =>
            if !@broken
                game.player.act @ability
        delay.add 1000, =>
            game.enemy.act()
        delay.add 1500, =>
            print 'ready for next turn'
            game.player.endTurn()
            game.enemy.endTurn()
        delay.start()
    onOverNode: ->
        @popup = new Popup 254, 304
        @popup.setHeading @ability.name
        @popup.setText @ability.text
    onOutNode: ->
        @popup.destroy()