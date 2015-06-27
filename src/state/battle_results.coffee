TEXT_STYLE =
    fontSize: 40
    fill: 'white'

module.exports =
    create: ->
        switch game.battleResult
            when 'victory'
                game.add.text(400, 200, "Victory!", TEXT_STYLE).anchor.set 0.5
            when 'defeat'
                game.add.text(400, 200, "Defeat...", TEXT_STYLE).anchor.set 0.5
        timer = game.time.create()
        timer.add 2000, ->
            text = game.add.text(400, 500, "Fight again?", TEXT_STYLE)
            text.anchor.set 0.5
            game.input.onUp.addOnce ->
                game.state.start 'select'
        timer.start()