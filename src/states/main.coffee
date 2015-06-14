Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

fieldData = require '../data/field'
playerData = require '../data/player'

state = {}

state.create = ->
    fieldData.init()
    playerData.init()
    fieldData.background = game.add.tileSprite 0, 0, 800, 600, 'pattern'
    fieldData.mask = game.add.image 0, 0, 'line'
    fieldData.mask.height = 600
    fieldData.mask.width = 800
    fieldData.mask.alpha = 0.2
    fieldData.mask.tint = 0x0000FF
    fieldData.edgeGroup = game.add.group()
    fieldData.edgeGroup.x = 10; fieldData.edgeGroup.y = 10
    fieldData.nodeGroup = game.add.group()
    fieldData.nodeGroup.x = 10; fieldData.nodeGroup.y = 10
    fieldData.iconGroup = game.add.group()
    fieldData.iconGroup.x = 10; fieldData.iconGroup.y = 10
    fieldData.hudMask = game.add.image 0, 0, 'hud_mask'
    fieldData.hudMask.inputEnabled = true
    fieldData.hudMask.input.pixelPerfectClick = true
    fieldData.hudMask.input.pixelPerfectOver = true
    root = new Node; fieldData.root = root
    fieldData.nodeGroup.add root
    root.edge.destroy()
    root.createChildren 4
    GraphUtils.arrangeNodes [root]
    playerData.hp = 100
    fieldData.enemyHp = 100

module.exports = state