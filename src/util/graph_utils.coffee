utils = {}
dist = Phaser.Math.distance
angle = Phaser.Math.angleBetween

utils.arrangeNodes = (tier, depth = 3) ->
    yOffset = 1
    for node in tier
        node.newX = (3 - depth) * 150
        node.newY = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth < 1
            node.x = 900
            node.y = node.newY
        game.tweens.create(node).to({ x: node.newX, y: node.newY }).start(500)
    if depth > 0
        nextTier = []
        for child in tier
            nextTier.push child.getChildren()...
        utils.arrangeNodes nextTier, depth - 1
    # edges are confused between before and after locations of nodes
        for node in tier
            for child in node.getChildren()
                game.tweens.create(child.edge).to({
                    width: dist node.newX, node.newY, child.newX, child.newY
                    rotation: angle node.newX, node.newY, child.newX, child.newY
                    x: node.newX
                    y: node.newY
                }).start()

module.exports = utils