Utils = require '../util/graph_utils'

class Field extends Phaser.Group
    constructor: ->
        super game
    arrangeNodes: Utils.arrangeNodes
            
module.exports = Field