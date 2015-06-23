Attack = require '../../ability/enemy/basic_abilities'

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @actionQueue = []
        @atk = 10
    act: ->
        nextAction = @getNextAction()
        game.field.hud.enemyActions.add nextAction
        @actionQueue.push @getNextAction()
        @actionQueue.shift().action.call @
    receiveDamage: (dmg) ->
        @hp -= dmg
    getNextAction: ->
        new Attack
    endTurn: ->

module.exports = BaseEnemy