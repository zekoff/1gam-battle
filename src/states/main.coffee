Field = require '../objects/field'
Player = require '../objects/player'
Enemy = require '../objects/enemy'

state = {}

state.create = ->
    game.field = new Field
    game.field.init()
    game.player = new Player
    game.enemy = new Enemy

module.exports = state