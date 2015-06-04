class Field extends Phaser.Group
    constructor: ->
        super(game)
    arrangeNodes: (root) ->
        # Put root node at left middle, flow out child nodes
        root.x = 25
        root.y = 300
        tier1 = root.getChildren()
        t1c = 1
        for child in tier1
            child.x = 100
            child.y = t1c++ * 500 / tier1.length
        tier2 = []
        for child in tier1
            tier2.push child.getChildren()...
        t2c = 1
        for child in tier2
            child.x = 200
            child.y = t2c++ * 500 / tier2.length
        tier3 = []
        for child in tier2
            tier3.push child.getChildren()...
        t3c = 1
        for child in tier3
            child.x = 300
            child.y = t3c++ * 500 / tier3.length
            
module.exports = Field