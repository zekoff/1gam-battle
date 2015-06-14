Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

fieldData = require '../data/field'
playerData = require '../data/player'

state = {}

state.create = ->
    fieldData.init()
    playerData.init()
    fieldData.edgeGroup = game.add.group()
    fieldData.nodeGroup = game.add.group()
    root = new Node; fieldData.root = root
    fieldData.nodeGroup.add root
    root.edge.destroy()
    root.createChildren 4
    GraphUtils.arrangeNodes [root]
    playerData.hp = 100
    fieldData.enemyHp = 100

module.exports = state