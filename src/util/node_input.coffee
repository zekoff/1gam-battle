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
        # insert delay
        if !@broken
            game.player.act @ability
        # insert delay; play animations; etc.
        game.enemy.act()
        # insert delay; play animations; etc.
        game.player.endTurn()
        game.enemy.endTurn()
    onOverNode: ->
        @popup = new Popup 254, 304
        @popup.setHeading @ability.name
        @popup.setText @ability.text
    onOutNode: ->
        @popup.destroy()