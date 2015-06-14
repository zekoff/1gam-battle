fieldData = require '../data/field'

class Attack
    name: 'Attack'
    tint: 0xFF0000
    icon: 'sword'
    constructor: ->
        @power = 10
        @text = "Perform a basic attack for #{@power} damage."
    action: ->
        print '10 damage'
        fieldData.enemyHp -= 10

module.exports = Attack