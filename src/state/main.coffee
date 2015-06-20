Field = require '../ui/field'
Player = require '../entity/player/base'
Enemy = require '../entity/enemy/base'

state = {}

state.create = ->
    game.player = new Player
    game.enemy = new Enemy
    game.field = new Field
    game.field.init()

module.exports = state