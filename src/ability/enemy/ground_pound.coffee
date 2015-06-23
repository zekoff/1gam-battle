BaseEnemyAbility = require './base'
BasicAbilities = require './basic_abilities'

class GroundPound extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Ground Pound"
    action: ->
        BasicAbilities.breakNodes 5

module.exports = GroundPound