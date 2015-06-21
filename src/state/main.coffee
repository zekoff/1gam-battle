Field = require '../ui/field'
Player = require '../entity/player/base'
Enemy = require '../entity/enemy/base'
Titan = require '../entity/enemy/titan'

state = {}

state.create = ->
    game.player = new Player
    game.enemy = new Titan
    game.field = new Field
    game.field.init()

module.exports = state