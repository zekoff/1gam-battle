utils = {}
dist = Phaser.Math.distance
angle = Phaser.Math.angleBetween
TWEEN_MS = 500

utils.shiftNodes = (newRoot, depth = 3) ->
    #for node in tier
        #game.tweens.create(node).to({
            #x: node.newX
            #y: node.newY
        #}, TWEEN_MS).start()
    #if depth > 0
        #for node in tier
            #for child in node.getChildren()
                #game.tweens.create(child.edge).to({
                    #width: dist node.newX, node.newY, child.newX, child.newY
                    #rotation: angle node.newX, node.newY, child.newX, child.newY
                    #x: node.newX
                    #y: node.newY
                #}, TWEEN_MS).start()
            #utils.shiftNodes child, depth - 1
    utils.arrangeNodes [newRoot], depth, 'newX', 'newY'
    # TODO: clean up old nodes
    

utils.arrangeNodes = (tier, depth = 3, xProperty = 'x', yProperty = 'y') ->
    yOffset = 1
    for node in tier
        node[xProperty] = (3 - depth) * 150
        node[yProperty] = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth < 1
            node[xProperty] = 900
            node[yProperty] = node.newY
        #game.tweens.create(node).to({ x: node.newX, y: node.newY }, TWEEN_MS).start()
    if depth > 0
        nextTier = []
        for child in tier
            nextTier.push child.getChildren()...
            #utils.arrangeNodes child.getChildren(), depth - 1
        utils.arrangeNodes nextTier, depth - 1
    for node in tier
        for child in node.getChildren()
            child.edge[xProperty] = node[xProperty]
            child.edge[yProperty] = node[yProperty]
            child.edge.width = dist node[xProperty], node[yProperty],
                child[xProperty], child[yProperty]
            child.edge.rotation = angle node[xProperty], node[yProperty],
                child[xProperty], child[yProperty]
                #game.tweens.create(child.edge).to({
                    #width: dist node.newX, node.newY, child.newX, child.newY
                    #rotation: angle node.newX, node.newY, child.newX, child.newY
                    #x: node.newX
                    #y: node.newY
                #}, TWEEN_MS).start()

module.exports = utils