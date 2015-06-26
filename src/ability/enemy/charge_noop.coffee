BaseEnemyAbility = require './base'

class ChargeNoop extends BaseEnemyAbility
    constructor: ->
        super()
        @setText "Charge"
    action: ->

module.exports = ChargeNoop