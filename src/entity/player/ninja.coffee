BasePlayer = require './base'
abilityList = [
    require '../../ability/player/attack'
    require '../../ability/player/disappear'
    require '../../ability/player/heal'
    require '../../ability/player/swap_stance'
    #require '../../ability/player/riposte'
    #require '../../ability/player/feint'
]

class Ninja extends BasePlayer
    constructor: ->
        super()
        @name = "Ninja"
        @stancePower = 0
        @lastStance = 'Empty'
        @lastColor = 0x808080
    getStanceInfo: ->
        {
            name: @lastStance
            description: "Ability power increased by #{@stancePower * 10}%.
            Decreases every turn you remain in the same stance."
            color: @lastColor
        }
    getRandomAbility: ->
        new (game.rnd.pick abilityList)
    receiveDamage: (dmg) ->
        if @disappear
            # no damage; play smoke effect?
        else
            @hp -= dmg
    applyStanceEffect: (ability) ->
        ability.power *= 1 + (@stancePower / 10)
    endTurn: ->
        super()
        @disappear = false
        @stancePower -= 5
        @stancePower = 0 if @stancePower < 0
        if @stance is 300 and @lastStance != 'Yin'
            @lastStance = 'Yin'
            @lastColor = 0x000000
            @stancePower = 20
        else if @stance is -300 and @lastStance != 'Yang'
            @lastStance = 'Yang'
            @lastColor = 0xFFFFFF
            @stancePower = 20

module.exports = Ninja