Field = require '../ui/field'
Player = require '../entity/player/base'
Swordsman = require '../entity/player/swordsman'
Ninja = require '../entity/player/ninja'
Wizard = require '../entity/player/wizard'
Enemy = require '../entity/enemy/base'
Titan = require '../entity/enemy/titan'

state = {}

state.create = ->
    game.player = new Wizard
    game.enemy = new Titan
    game.field = new Field
    game.field.init()
    game.enemy.init()

module.exports = state