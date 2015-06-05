class Field extends Phaser.Group
    constructor: ->
        super game
    arrangeNodes: (tier, depth = 3) ->
        yOffset = 1
        for child in tier
            child.x = (3 - depth) * 150
            child.y = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth > 0
            nextTier = []
            for child in tier
                nextTier.push child.getChildren()...
            @arrangeNodes nextTier, --depth
            
module.exports = Field