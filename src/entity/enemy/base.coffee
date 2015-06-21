breakNodes = require '../../ability/enemy/break_node'

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @ai = []
        @atk = 10
        @ai.push @attack
    act: ->
        @ai.slice(-1)[0]()
    receiveDamage: (dmg) ->
        @hp -= dmg
    attack: ->
        game.player.receiveDamage @atk
    endTurn: ->

module.exports = BaseEnemy