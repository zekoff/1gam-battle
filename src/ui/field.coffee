Background = require './background'
Hud = require './hud'
Node = require './node'
GraphUtils = require '../util/graph_utils'

class Field
    constructor: ->
        @background = new Background
        for group in ['edges','nodes','icons']
            @[group] = game.add.group()
            @[group].x = 10; @[group].y = 10
        @hud = new Hud
    init: ->
        @root = new Node
        @nodes.add @root
        @root.edge.destroy()
        @root.createChildren 4
        GraphUtils.arrangeNodes [@root]

module.exports = Field