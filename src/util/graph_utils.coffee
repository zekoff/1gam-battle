utils = {}
dist = Phaser.Math.distance
angle = Phaser.Math.angleBetween
TWEEN_MS = 1000

utils.shiftNodes = (oldRoot, newRoot, depth = 3) ->
    utils.arrangeNodes [newRoot], depth, 'newX', 'newY', 'newWidth', 'newRotation'
    # TODO: clean up old nodes
    utils.shiftChildren newRoot, depth
    
utils.shiftChildren = (node, depth = 3) ->
    for child in node.getChildren()
        game.tweens.create(child).to({
            x: child.newX
            y: child.newY
        }, TWEEN_MS).start()
        game.tweens.create(child.edge).to({
            width: dist node.newX, node.newY, child.newX, child.newY
            rotation: angle node.newX, node.newY, child.newX, child.newY
            x: node.newX
            y: node.newY
        }, TWEEN_MS).start()
        if depth > 0
            utils.shiftChildren child, depth - 1

utils.arrangeNodes = (tier, depth = 3, xProperty = 'x', yProperty = 'y', widthProperty = 'width', rotationProperty = 'rotation') ->
    yOffset = 1
    for node in tier
        node[xProperty] = (3 - depth) * 150
        node[yProperty] = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth < 0 # bizarre... need to think on this
            node[xProperty] = 900
            node[yProperty] = node[yProperty]
    if depth > 0
        nextTier = []
        for child in tier
            nextTier.push child.getChildren()...
        utils.arrangeNodes nextTier, depth - 1, xProperty, yProperty
    for node in tier
        for child in node.getChildren()
            child.edge[xProperty] = node[xProperty]
            child.edge[yProperty] = node[yProperty]
            child.edge[widthProperty] = dist node[xProperty], node[yProperty],
                child[xProperty], child[yProperty]
            child.edge[rotationProperty] = angle node[xProperty], node[yProperty],
                child[xProperty], child[yProperty]

module.exports = utils