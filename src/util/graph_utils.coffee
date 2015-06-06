utils = {}
dist = Phaser.Math.distance
angle = Phaser.Math.angleBetween

utils.arrangeNodes = (tier, depth = 3) ->
    yOffset = 1
    for node in tier
        newX = (3 - depth) * 150
        newY = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth < 1
            node.x = 900
            node.y = newY
        game.tweens.create(node).to({ x: newX, y: newY }).start(500)
    if depth > 0
        nextTier = []
        for child in tier
            nextTier.push child.getChildren()...
        utils.arrangeNodes nextTier, depth - 1
    # edges are confused between before and after locations of nodes
    for node in tier
        for child in node.getChildren()
            game.tweens.create(child.edge).to({
                width: dist node.x, node.y, child.x, child.y
                rotation: angle node.x, node.y, child.x, child.y
                x: node.x
                y: node.y
            }).start()

module.exports = utils