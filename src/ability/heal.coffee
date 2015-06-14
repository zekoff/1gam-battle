playerData = require '../data/player'

class Heal
    power: 10
    name: 'Heal'
    text: "Heal yourself for 10 HP."
    tint: 0x00FF00
    icon: 'potion'
    action: ->
        print 'healed for 10'
        playerData.hp += 10
        playerData.hp = 100 if playerData.hp > 100

module.exports = Heal