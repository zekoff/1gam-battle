breakNodes = require '../../ability/enemy/break_node'
attack = require '../../ability/enemy/attack'

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @actionQueue = []
        @atk = 10
        @actionQueue.push attack
    act: ->
        @actionQueue.push @getNextAction()
        @actionQueue.shift().call @
    receiveDamage: (dmg) ->
        @hp -= dmg
    getNextAction: ->
        attack
    endTurn: ->

module.exports = BaseEnemy