class Field extends Phaser.Group
    constructor: ->
        super game
    arrangeNodes: (root) ->
        # Put root node at left middle, flow out child nodes
        root.x = 25
        root.y = 300
        
        # up to X times
        tiersToArrange = 3
        # with array of nodes in current tier
        
        # fresh array that will contain next tier
        # fill fresh array with children of this tier
        # arrange children of this tier
        # recurse into next tier, decrementing tiers counter
        
        
        tier1 = root.getChildren()
        t1c = 1
        for child in tier1
            child.x = 150
            child.y = t1c++ * 600 / tier1.length - 600 / tier1.length / 2
        tier2 = []
        for child in tier1
            tier2.push child.getChildren()...
        t2c = 1
        for child in tier2
            child.x = 330
            child.y = t2c++ * 600 / tier2.length - 600 / tier2.length / 2
        tier3 = []
        for child in tier2
            tier3.push child.getChildren()...
        t3c = 1
        for child in tier3
            child.x = 550
            child.y = t3c++ * 600 / tier3.length - 600 / tier3.length / 2
            
module.exports = Field