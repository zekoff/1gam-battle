fieldData = require '../data/field'

class Heal
    name: 'Heal'
    tint: 0x00FF00
    icon: 'potion'
    constructor: ->
        @power = 10
        @text = "Heal yourself for #{@power} HP."
    action: ->
        print 'healed for 10'
        fieldData.player.hp += 10
        fieldData.player.hp = 100 if fieldData.player.hp > 100

module.exports = Heal