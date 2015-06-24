Attack = require '../../ability/enemy/basic_abilities'

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @actionQueue = []
        @atk = 10
    init: ->
    act: ->
        if @actionQueue.length < 4
            @queueAction @getNextAction()
        @dequeAction().action.call @
        #@placeActionsOnLine()
        @shiftActionsDownLine()
    receiveDamage: (dmg) ->
        @hp -= dmg
    getNextAction: ->
        new Attack
    endTurn: ->
    ###
    An action is an object with Phaser.Text in its prototype chain, with a
    function named action that performs whatever the ability is supposed to do.
    ###
    queueAction: (action, fromFront = false) ->
        game.field.hud.enemyActions.add action
        if fromFront
            @actionQueue.shift action
        else
            @actionQueue.push action
    placeActionsOnLine: ->
        i = 0
        for action in @actionQueue
            if i < 3
                action.visible = true
                action.y = 310 - (i * 110)
            else
                action.visible = false
            i++
    shiftActionsDownLine: ->
        i = 0
        for action in @actionQueue
            if i < 2
                action.visible = true
                game.tweens.create(action).to(
                    y: action.y + 110
                , 500).start()
            else if i is 2
                action.visible = true
                action.y = -10
                game.tweens.create(action).to(
                    y: 310 - (i * 110)
                , 500).start()
            i++
    dequeAction: ->
        action = @actionQueue.shift()
        game.field.hud.enemyActions.remove action
        return action

module.exports = BaseEnemy