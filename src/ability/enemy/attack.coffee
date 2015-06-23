BaseEnemyAbility = require './base'
BasicAbilities = require './basic_abilities'

class EnemyAttack extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Attack"
    action: BasicAbilities.attack

module.exports = EnemyAttack