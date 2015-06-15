Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'
Background = require '../ui/background'
Hud = require '../ui/hud'

fieldData = require '../data/field'

state = {}

state.create = ->
    fieldData.init()
    fieldData.background = new Background
    fieldData.edgeGroup = game.add.group()
    fieldData.edgeGroup.x = 10; fieldData.edgeGroup.y = 10
    fieldData.nodeGroup = game.add.group()
    fieldData.nodeGroup.x = 10; fieldData.nodeGroup.y = 10
    fieldData.iconGroup = game.add.group()
    fieldData.iconGroup.x = 10; fieldData.iconGroup.y = 10
    fieldData.hud = new Hud
    
    root = new Node; fieldData.root = root
    fieldData.nodeGroup.add root
    root.edge.destroy()
    root.createChildren 4
    GraphUtils.arrangeNodes [root]

module.exports = state