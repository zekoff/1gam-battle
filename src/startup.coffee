global.print = console.log.bind console

global.game = new Phaser.Game
game.state.add 'load', require './states/load'
game.state.add 'title', require './states/title'
game.state.add 'main', require './states/main'
game.state.start 'load'