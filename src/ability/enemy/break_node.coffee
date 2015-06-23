module.exports = (number = 1) ->
    nodes = game.field.root.getChildren 3
    for i in [0..number - 1]
        game.rnd.pick(nodes).tint = 0x000000