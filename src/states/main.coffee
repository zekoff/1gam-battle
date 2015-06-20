Field = require '../objects/field'
Player = require '../objects/player'
Enemy = require '../objects/enemy'

state = {}

state.create = ->
    game.player = new Player
    game.enemy = new Enemy
    game.field = new Field
    game.field.init()

module.exports = state