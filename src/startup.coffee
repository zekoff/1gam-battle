global.print = console.log.bind console

global.game = new Phaser.Game
game.state.add 'load', require './state/load'
game.state.add 'title', require './state/title'
game.state.add 'main', require './state/main'
game.state.add 'select', require './state/battle_select'
game.state.add 'results', require './state/battle_results'
game.state.start 'load'