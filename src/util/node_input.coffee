GraphUtils = require './graph_utils'
Popup = require '../ui/popup'

adjustStance = ->
    game.player.changeStance game.field.root.y - @y
    stanceLocation = (game.player.stance + 300) / 600 # normalized
    stanceLocation = (1 - stanceLocation)
    stanceLocation *= game.field.hud.STANCE_LOW - game.field.hud.STANCE_HIGH
    stanceLocation += game.field.hud.STANCE_HIGH
    game.field.hud.stanceIndicator.y = stanceLocation
    game.field.hud.stanceIndicator.tint = game.player.getStanceInfo().color

module.exports =
    nodeActivated: ->
        for node in game.field.root.getChildren()
            node.disableInput()
        @popup?.destroy()
        adjustStance.call @
        game.player.applyStanceEffect @ability
        GraphUtils.advanceNodes.call @
        @edgeEffect?.activate()
        delay = game.time.create()
        delay.add 500, =>
            if !@broken
                game.player.act @ability
            if game.enemy.hp <= 0
                print "YOU WIN"
                game.battleResult = 'victory'
                game.state.start 'results'
        delay.add 1000, =>
            game.enemy.act()
            if game.player.hp <= 0
                print "YOU LOSE"
                game.battleResult = 'defeat'
                game.state.start 'results'
        delay.add 1500, =>
            game.player.endTurn()
            game.enemy.endTurn()
            adjustStance.call @
            for node in game.field.root.getChildren()
                node.enableInput()
        delay.start()
    onOverNode: ->
        @popup = new Popup 254, 304
        @popup.setHeading @ability.name
        @popup.setText @ability.text
    onOutNode: ->
        @popup.destroy()