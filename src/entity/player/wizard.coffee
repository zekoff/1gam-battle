BasePlayer = require './base'
abilityList = [
    require '../../ability/player/mage_armor'
    require '../../ability/player/fireball'
    require '../../ability/player/ice_lance'
    require '../../ability/player/magic_missile'
    # mana tap (do something to edges)
]

class Wizard extends BasePlayer
    constructor: ->
        super()
        @name = "Wizard"
        @mageArmor = 0
    receiveDamage: (dmg) ->
        if game.rnd.frac() < @mageArmor
            @mageArmor = 0
            game.enemy.receiveDamage(dmg)
        else
            @hp -= dmg * (1 - @mageArmor)
    getRandomAbility: ->
        new (game.rnd.pick abilityList)
    getStanceInfo: ->
        if @stance > 100
            {name:"Fire-Charged",description:"50% change to crit with Fireball for double damage",color:0xff8000}
        else if @stance < -100
            {name:"Ice-Charged",description:"30% chance to launch three Ice Lances instead of one",color:0x4000ff}
        else
            {name:"Mana-Rich",description:"+20% power to all spells",color:0xaaaacc}
    applyStanceEffect: (ability) ->
        switch @getStanceInfo().name
            when "Fire-Charged"
                if ability.name is "Fireball"
                    ability.power *= 2 if game.rnd.frac() < .5
            when "Ice-Charged"
                if ability.name is "Ice Lance"
                    ability.power *= 3 if game.rnd.frac() < .3
            when "Mana-Rich"
                ability.power *= 1.2
    endTurn: ->
        super()

module.exports = Wizard