module.exports =
    attack: ->
        game.player.receiveDamage game.enemy.atk
    breakNodes: (number = 1) ->
        nodes = game.field.root.getChildren 3
        for i in [0..number - 1]
            node = game.rnd.pick(nodes)
            node.tint = 0x000000
            node.broken = true
            node.icon.alpha = 0.5