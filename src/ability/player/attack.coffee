class Attack
    name: 'Attack'
    tint: 0xFF0000
    icon: 'sword'
    constructor: ->
        @power = 10
        @text = "Perform a basic attack for #{@power} damage."
    action: ->
        game.enemy.hp -= @power

module.exports = Attack