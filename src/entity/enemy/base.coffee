Attack = require '../../ability/enemy/basic_abilities'

QUEUE_BACK = 90
QUEUE_FRONT = 310
QUEUE_STEP = (QUEUE_FRONT - QUEUE_BACK) / 3

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @actionQueue = []
        @atk = 10
    init: ->
    act: ->
        shouldShift = false
        if @actionQueue.length < 4
            @queueAction @getNextAction()
        @dequeAction().action.call @
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
            action.visible = true
            game.tweens.create(action).to(
                y: QUEUE_FRONT - i * 110
            , 500).start()
            i++
    dequeAction: ->
        action = @actionQueue.shift()
        game.tweens.create(action).to(
            y: QUEUE_FRONT + 100
        , 500).start()
        game.tweens.create(action.scale).to(
            x: 2
            y: 2
        , 500).start()
        timer = game.time.create()
        timer.add 1000, ->
            game.field.hud.enemyActions.remove action
        timer.start()
        return action

module.exports = BaseEnemy