BaseAbility = require './base'

class IceLance extends BaseAbility
    name: "Ice Lance"
    tint: 0x4000ff
    icon: 'ice_lance'
    constructor: ->
        @power = 10        
        @text = "Launch an ice lance for #{@power} damage."
    action: ->
        game.enemy.receiveDamage @power

module.exports = IceLance