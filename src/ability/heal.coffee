class Heal
    name: 'Heal'
    tint: 0x00FF00
    icon: 'potion'
    constructor: ->
        @power = 10
        @text = "Heal yourself for #{@power} HP."
    action: ->
        print 'healed for 10'
        game.player.hp += 10
        game.player.hp = 100 if game.player.hp > 100

module.exports = Heal