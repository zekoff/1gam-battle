BasicAbilities = require '../../ability/enemy/basic_abilities'

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @actionQueue = []
        @atk = 10
        @actionQueue.push BasicAbilities.attack
    act: ->
        @actionQueue.push @getNextAction()
        @actionQueue.shift().call @
    receiveDamage: (dmg) ->
        @hp -= dmg
    getNextAction: ->
        attack
    endTurn: ->

module.exports = BaseEnemy