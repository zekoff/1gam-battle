BasePlayer = require './base'
abilityList = [
    require '../../ability/player/attack'
    require '../../ability/player/defend'
    require '../../ability/player/heal'
    require '../../ability/player/riposte'
    require '../../ability/player/feint'
]

class Swordsman extends BasePlayer
    constructor: ->
        super()
        @name = "Swordsman"
    receiveDamage: (dmg) ->
        if @blocking
            dmg *= (1 - @blocking.power) if @blocking
            @hp -= dmg
        else if @riposte
            print "Riposte!"
            game.enemy.receiveDamage dmg *= @riposte.power
        else
            @hp -= dmg
    getRandomAbility: ->
        new (game.rnd.pick abilityList)
    endTurn: ->
        super()
        @riposte = null

module.exports = Swordsman