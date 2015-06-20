abilityList = [
    require '../../ability/player/attack'
    require '../../ability/player/defend'
    require '../../ability/player/heal'
]

class BasePlayer extends Phaser.Sprite
    constructor: ->
        super game, 0, 0, 'circle'
        @hp = 100
    endTurn: ->
        @blocking = false
    getRandomAbility: ->
        new (game.rnd.pick abilityList)
    act: (ability) ->
        ability.action()

module.exports = BasePlayer