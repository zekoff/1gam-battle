utils = {}

utils.arrangeNodes = (tier, depth = 3) ->
    yOffset = 1
    for child in tier
        newX = (3 - depth) * 150
        newY = yOffset++ * 600 / tier.length - 600 / tier.length / 2
        if depth < 1
            child.x = 900
            child.y = newY
        game.tweens.create(child).to({ x: newX, y: newY }).start()
    if depth > 0
        nextTier = []
        for child in tier
            nextTier.push child.getChildren()...
        utils.arrangeNodes nextTier, --depth

module.exports = utils