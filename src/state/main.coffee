Field = require '../ui/field'
Player = require '../entity/player/base'
Swordsman = require '../entity/player/swordsman'
Ninja = require '../entity/player/ninja'
Wizard = require '../entity/player/wizard'
Enemy = require '../entity/enemy/base'
Titan = require '../entity/enemy/titan'
Naga = require '../entity/enemy/naga'
Kobold = require '../entity/enemy/kobold'

state = {}

state.create = ->
    game.player = new Ninja
    game.enemy = new Kobold
    game.field = new Field
    game.field.init()
    game.enemy.init()

module.exports = state