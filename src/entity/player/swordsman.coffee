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
    getStanceName: ->
        if @stance > 100
            "Patient"
        else if @stance < -100
            "Aggressive"
        else
            "Balanced"
    applyStanceEffect: (ability) ->
        #print @getStanceName()
        switch @getStanceName()
            when "Patient"
                if ability.name is "Riposte"
                    #print 'patient riposte'
                    ability.power *= 1.5
            when "Aggressive"
                unless ability.name is "Riposte"
                    #print 'aggressive non-riposte'
                    ability.power *= 1.5
            when "Balanced"
                ability.power *= 1.1

module.exports = Swordsman