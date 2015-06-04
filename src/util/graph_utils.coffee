Node = require '../objects/node'

utils = {}

utils.createDisplayFromGraph = (graph, group, root) ->
    rootObj = graph.getNode root
    x = 0
    y = 0
    group.add new Node x, y
    x++
    extras = for node in graph.getOutEdgesOf root
        group.add new Node x * 50, y++ * 50

module.exports = utils