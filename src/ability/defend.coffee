fieldData = require '../data/field'

class Defend
    name: 'Defend'
    tint: 0x0000FF
    icon: 'shield'
    constructor: ->
        @power = 0.5
        @text = "Block the next attack to reduce damage by #{@power * 100}%."
    action: ->
        print 'blocked'
        fieldData.player.blocking = true

module.exports = Defend