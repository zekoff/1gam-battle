Graph = require('data-structures').Graph
Node = require '../objects/node'

state = {}

state.create = ->
    graph = new Graph
    a = graph.addNode 'A'
    console.log a
    a = new Node a
    console.log a
    game.add.existing a
    a.x = 50
    a.y = 50

module.exports = state