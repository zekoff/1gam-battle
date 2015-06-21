abilityList = [
    require '../../ability/player/attack'
    require '../../ability/player/defend'
    require '../../ability/player/heal'
]
MAX_STANCE = 300

class BasePlayer extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
        @stance = 0
    getRandomAbility: ->
        new (game.rnd.pick abilityList)
    act: (ability) ->
        ability.action()
    receiveDamage: (dmg) ->
        dmg *= (1 - @blocking.power) if @blocking
        @hp -= dmg
    ###
    Stance increases for higher node selections; decreases for lower.
    ###
    changeStance: (delta) ->
        @stance += delta
        @stance = MAX_STANCE if @stance > MAX_STANCE
        @stance = -MAX_STANCE if @stance < -MAX_STANCE
    getStanceName: ->
        "Balanced"
    applyStanceEffect: (ability) ->
        ability.power *= 1.1 if ability.power
    endTurn: ->
        @blocking = null

module.exports = BasePlayer