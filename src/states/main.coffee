Graph = require('data-structures').Graph
Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

state = {}

state.create = ->
    graph = new Graph
    field = game.add.group()
    graph.addNode 'A'
    graph.addNode 'B'
    graph.addNode 'C'
    graph.addNode 'D'
    graph.addEdge 'A', 'B'
    graph.addEdge 'A', 'D'
    graph.addEdge 'B', 'C'
    GraphUtils.createDisplayFromGraph graph, field, 'A'

module.exports = state