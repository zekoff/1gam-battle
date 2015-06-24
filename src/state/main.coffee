Field = require '../ui/field'
Player = require '../entity/player/base'
Swordsman = require '../entity/player/swordsman'
Enemy = require '../entity/enemy/base'
Titan = require '../entity/enemy/titan'

state = {}

state.create = ->
    game.player = new Swordsman
    game.enemy = new Titan
    game.field = new Field
    game.field.init()
    game.enemy.init()

module.exports = state