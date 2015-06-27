TEXT_STYLE =
    fontSize: 36
    fill: 'black'

state = {}

state.create = ->
    game.add.image 0, 0, 'title_image'
    timer = game.time.create()
    timer.add 2000, ->
        game.add.text(400, 550, "Begin?", TEXT_STYLE).anchor.set 0.5
        game.input.onUp.addOnce ->
            game.state.start 'select'
    timer.start()

module.exports = state