utils = {}
dist = Phaser.Math.distance
angle = Phaser.Math.angleBetween
TWEEN_MS = 500

utils.shiftNodes = (oldRoot, newRoot, depth = 4) ->
    utils.arrangeNodes [newRoot], depth, true
    # TODO: clean up old nodes
    newNodes = newRoot.getChildren depth
    oldNodes = oldRoot.getChildren depth
    for node in oldNodes
        if node not in newNodes
            node.edge?.kill()
            node.kill()
    utils.shiftChildren newRoot, depth
    
###
Starting with the given node, create a tween animation for each node which moves
it to its new location based on its newX/newY.
###
utils.shiftChildren = (node, depth = 4) ->
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

###
Starting with the given tier, set the X/Y properties of nodes to the specified
depth so that they are arranged in a tree. If the prepass parameter is true,
set the newX/newY propoerties instead of directly setting the X/Y propoerties.
###
utils.arrangeNodes = (tier, depth = 4, prepass = false) ->
    xProperty = 'x'; yProperty = 'y'
    widthProperty = 'width'; rotationProperty = 'rotation'
    if prepass
        xProperty = 'newX'; yProperty = 'newY'
        widthProperty = 'newWidth'; rotationProperty = 'newRotation'
    yOffset = 1
    for node in tier
        node[xProperty] =  30 + (4 - depth) * 200
        node[yProperty] = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth is 0
            node[xProperty] = 900
            node[yProperty] = node[yProperty]
    if depth > 0
        nextTier = []
        for child in tier
            nextTier.push child.getChildren()...
        utils.arrangeNodes nextTier, depth - 1, prepass
    for node in tier
        for child in node.getChildren()
            child.edge[xProperty] = node[xProperty]
            child.edge[yProperty] = node[yProperty]
            child.edge[widthProperty] = dist node[xProperty], node[yProperty],
                child[xProperty], child[yProperty]
            child.edge[rotationProperty] = angle node[xProperty], node[yProperty],
                child[xProperty], child[yProperty]

module.exports = utils