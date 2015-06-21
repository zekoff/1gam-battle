abilityList = [
    require '../../ability/player/attack'
    require '../../ability/player/defend'
    require '../../ability/player/heal'
]

class BasePlayer extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
    getRandomAbility: ->
        new (game.rnd.pick abilityList)
    act: (ability) ->
        ability.action()
    receiveDamage: (dmg) ->
        dmg *= 0.5 if @blocking
        @hp -= dmg
    endTurn: ->
        @blocking = false

module.exports = BasePlayer