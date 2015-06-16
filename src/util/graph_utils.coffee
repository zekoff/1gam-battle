dist = Phaser.Math.distance
angle = Phaser.Math.angleBetween
TWEEN_MS = 500
FIELD_HEIGHT = 400
FIELD_WIDTH = 550
TIERS_ONSCREEN = 4
TIER_SPACING = FIELD_WIDTH / TIERS_ONSCREEN
LEFT_EDGE_PADDING = 30

utils = {}

utils.shiftNodes = (oldRoot, newRoot, depth = TIERS_ONSCREEN + 1) ->
    game.tweens.create(game.field.background.pattern.tilePosition).to(
        x: game.field.background.pattern.tilePosition.x + oldRoot.x - newRoot.x
        y: game.field.background.pattern.tilePosition.y + oldRoot.y - newRoot.y
    , TWEEN_MS).start()
    utils.arrangeNodes [newRoot], depth, true
    newNodes = newRoot.getChildren depth
    newNodes.push newRoot
    oldNodes = oldRoot.getChildren depth
    oldNodes.push oldRoot
    for node in oldNodes
        if node not in newNodes
            node.edge?.kill()
            node.icon?.kill()
            node.kill()
    newRoot.edge.destroy()
    game.tweens.create(newRoot).to(
        x: LEFT_EDGE_PADDING
        y: FIELD_HEIGHT / 2
    , TWEEN_MS).start()
    game.tweens.create(newRoot.icon).to(
        x: LEFT_EDGE_PADDING
        y: FIELD_HEIGHT / 2
    , TWEEN_MS).start()
    utils.shiftChildren newRoot, depth
    
###
Starting with the given node, create a tween animation for each node which moves
it to its new location based on its newX/newY.

Set newX/newY by calling arrangeNodes on the new desired root node and setting
the prepass parameter to true.
###
utils.shiftChildren = (node, depth = TIERS_ONSCREEN + 1) ->
    for child in node.getChildren()
        game.tweens.create(child).to(
            x: child.newX
            y: child.newY
        , TWEEN_MS).start()
        game.tweens.create(child.icon).to(
            x: child.newX
            y: child.newY
        , TWEEN_MS).start()
        game.tweens.create(child.edge).to(
            width: dist node.newX, node.newY, child.newX, child.newY
            rotation: angle node.newX, node.newY, child.newX, child.newY
            x: node.newX
            y: node.newY
        , TWEEN_MS).start()
        if depth > 1
            utils.shiftChildren child, depth - 1

###
Starting with the given tier, set the X/Y properties of nodes to the specified
depth so that they are arranged in a tree. If the prepass parameter is true,
set the newX/newY properties instead of directly setting the X/Y properties.

The `depth` parameter specifies how many tiers AFTER the parameter `tier` will
also be arranged. This should include the tier that hangs off the end of the
field.
###
utils.arrangeNodes = (tier, depth = TIERS_ONSCREEN + 1, prepass = false) ->
    xProperty = 'x'; yProperty = 'y'
    widthProperty = 'width'; rotationProperty = 'rotation'
    if prepass
        xProperty = 'newX'; yProperty = 'newY'
        widthProperty = 'newWidth'; rotationProperty = 'newRotation'
    yOffset = 1
    for node in tier
        node[xProperty] = LEFT_EDGE_PADDING + (TIERS_ONSCREEN + 1 - depth) * TIER_SPACING
        node[yProperty] = yOffset++ * FIELD_HEIGHT / tier.length - FIELD_HEIGHT / tier.length / 2
        if depth is 1
            node[xProperty] = TIER_SPACING * (TIERS_ONSCREEN) + LEFT_EDGE_PADDING
            node[yProperty] = node[yProperty]
        node.icon[xProperty] = node[xProperty]
        node.icon[yProperty] = node[yProperty]
    if depth > 1
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