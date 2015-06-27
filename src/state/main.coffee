Field = require '../ui/field'
Player = require '../entity/player/base'
Noble = require '../entity/player/swordsman'
Ninja = require '../entity/player/ninja'
Wizard = require '../entity/player/wizard'
Enemy = require '../entity/enemy/base'
Titan = require '../entity/enemy/titan'
Naga = require '../entity/enemy/naga'
Kobold = require '../entity/enemy/kobold'

state = {}

state.create = ->
    switch game.selectedHero.heroName
        when "Noble" then game.player = new Noble
        when "Ninja" then game.player = new Ninja
        when "Wizard" then game.player = new Wizard
    switch game.selectedEnemy
        when "Kobold" then game.enemy = new Kobold
        when "Naga" then game.enemy = new Naga
        when "Titan" then game.enemy = new Titan
    game.field = new Field
    game.field.init()
    game.enemy.init()

module.exports = state