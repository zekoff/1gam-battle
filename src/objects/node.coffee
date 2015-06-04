class Node extends Phaser.Sprite
    constructor: (x = 0, y = 0, type = 'circle')->
        super(game, x, y, type)
        
module.exports = Node