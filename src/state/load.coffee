state = {}

state.preload = ->
    game.load.baseURL = './assets/'
    
state.create = ->
    game.load.image 'circle', 'images/circle.png'
    game.load.image 'line', 'images/line.png'
    game.load.image 'pattern', 'images/pattern.png'
    game.load.image 'hud_mask', 'images/hud_mask_2.png'
    game.load.image 'sword', 'images/W_Sword003.png'
    game.load.image 'buff', 'images/S_Buff08.png'
    game.load.image 'potion', 'images/P_Red07.png'
    game.load.image 'shield', 'images/E_Wood03.png'
    game.load.image 'fireball', 'images/S_Fire03.png'
    game.load.image 'ice_lance', 'images/S_Ice03.png'
    game.load.image 'mage_armor', 'images/S_Buff03.png'
    game.load.image 'magic_missile', 'images/S_Light01.png'
    game.load.image 'mana_tap', 'images/S_Magic02.png'
    game.load.image 'disappear', 'images/S_Shadow05.png'
    game.load.image 'swap_stance', 'images/S_Shadow02.png'
    game.load.start()
    
state.update = ->
    game.state.start 'title' if game.load.hasLoaded

module.exports = state