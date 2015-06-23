module.exports =
    attack: ->
        game.player.receiveDamage game.enemy.atk
    breakNodes: (number = 1) ->
        print 'breakNodes'
        nodes = game.field.root.getChildren 3
        for i in [0..number - 1]
            # actual 'break' logic
            game.rnd.pick(nodes).tint = 0x000000