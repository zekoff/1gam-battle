Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

state = {}

state.create = ->
    window.root = new Node
    game.world.add root
    root.createChildren 4
    GraphUtils.arrangeNodes [root]
    for n in root.getChildren 4
        game.world.add n
    enemyTimer = game.time.create()
    playerHp = 100
    timerFunction = ->
        hpLost = 10
        hpLost /= 2 if window.blockedLast
        window.blockedLast = false
        playerHp -= hpLost
        print "Player HP: #{playerHp}"
        enemyTimer.add 2000, timerFunction
    enemyTimer.add 2000, timerFunction
    enemyTimer.start()
        
module.exports = state