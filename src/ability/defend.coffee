playerData = require '../data/player'

class Defend
    power: .5
    name: 'Defend'
    text: "Block the next attack to reduce damage by 50%."
    tint: 0x0000FF
    icon: 'shield'
    action: ->
        print 'blocked'
        playerData.blocking = true

module.exports = Defend