GraphUtils = require './graph_utils'
Popup = require '../ui/popup'

module.exports =
    nodeActivated: ->
        @popup?.destroy()
        GraphUtils.advanceNodes.call @
        game.player.act @ability
        game.enemy.act()
        game.player.endTurn()
        game.enemy.endTurn()
    onOverNode: ->
        @popup = new Popup 254, 304
        @popup.setHeading @ability.name
        @popup.setText @ability.text
    onOutNode: ->
        @popup.destroy()