STYLE =
    fontAlign: 'center'
    fontSize: 16
    fontWeight: 'bold'
    backgroundColor: 'white'
    fill: 'black'

class BaseEnemyAbility extends Phaser.Text
    constructor: (x = 700, y = 50, text = "Action") ->
        super game, x, y, text, STYLE
        @anchor.set .5
        @x = x; @y = y; @setText text

module.exports = BaseEnemyAbility