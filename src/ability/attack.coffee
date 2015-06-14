fieldData = require '../data/field'

class Attack
    power: 10
    name: 'Attack'
    text: "Perform a basic attack for 10 damage."
    tint: 0xFF0000
    icon: 'sword'
    action: ->
        print '10 damage'
        fieldData.enemyHp -= 10

module.exports = Attack