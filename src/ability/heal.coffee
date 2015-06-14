playerData = require '../data/player'

class Heal
    name: 'Heal'
    tint: 0x00FF00
    icon: 'potion'
    constructor: ->
        @power = 10
        @text = "Heal yourself for #{@power} HP."
    action: ->
        print 'healed for 10'
        playerData.hp += 10
        playerData.hp = 100 if playerData.hp > 100

module.exports = Heal