BaseEnemyAbility = require './base'
BasicAbilities = require './basic_abilities'

class Bite extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Bite"
    action: BasicAbilities.attack

module.exports = Bite