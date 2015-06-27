BaseEnemy = require './base'
Constrict = require '../../ability/enemy/constrict'
Poison = require '../../ability/enemy/poison'
Leech = require '../../ability/enemy/leech'
Bite = require '../../ability/enemy/bite'

class Naga extends BaseEnemy
    constructor: ->
        super()
        @name = "Naga"
        @hp = 250
        @atk = 7
    getNextAction: ->
        chance = game.rnd.frac()
        if chance < .2
            return new Constrict()
        else if chance < .4
            return new Poison()
        else if chance < .7
            return new Leech()
        else
            return new Bite()

module.exports = Naga