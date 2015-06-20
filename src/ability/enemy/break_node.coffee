module.exports = (number = 1) ->
    # really need to trigger this after the node shift
    # get 3rd and 4th level nodes
    nodes = []
    temp = game.field.root.getChildren()
    for node in temp
        nodes.push node.getChildren(2)...
    # this isn't exactly right... but it'll do
    for i in [0..number - 1]
        game.rnd.pick(nodes).tint = 0x000000