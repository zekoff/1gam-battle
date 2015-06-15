Player = require '../objects/player'
Enemy = require '../objects/enemy'

fieldData = {}
fieldData.init = ->
    fieldData.root = null
    fieldData.enemyHp = null
    fieldData.nodeGroup = null
    fieldData.edgeGroup = null
    fieldData.iconGroup = null
    
    fieldData.player = new Player
    fieldData.enemy = new Enemy

module.exports = fieldData