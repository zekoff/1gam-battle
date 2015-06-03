state = {}

state.preload = ->
    game.load.baseURL = './assets/'
    
state.create = ->
    game.load.image 'circle', 'images/circle.png'
    game.load.start()
    
state.update = ->
    game.state.start 'title' if game.load.hasLoaded

module.exports = state