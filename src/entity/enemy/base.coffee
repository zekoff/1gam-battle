breakNodes = require '../../ability/enemy/break_node'

class BaseEnemy extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @name = "Base Enemy"
        @hp = 100
        @atk = 10
        @turn = 0
    act: ->
        game.player.receiveDamage @atk
    receiveDamage: (dmg) ->
        @hp -= dmg
    endTurn: ->

module.exports = BaseEnemy