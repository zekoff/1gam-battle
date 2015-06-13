Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

state = {}

state.create = ->
    window.root = new Node
    game.world.add root
    root.edge.destroy()
    root.createChildren 4
    GraphUtils.arrangeNodes [root]
    for n in root.getChildren 4
        game.world.add n
    enemyTimer = game.time.create()
    window.playerHp = 100
    timerFunction = ->
        hpLost = 10
        hpLost /= 2 if window.blockedLast
        window.blockedLast = false
        window.playerHp -= hpLost
        print "Player HP: #{window.playerHp}"
        enemyTimer.add 2000, timerFunction
    enemyTimer.add 2000, timerFunction
    enemyTimer.start()
    window.enemyHp = 100

state.update = ->
    #if window.enemyHp <= 0
        #print "*** YOU WIN!!!! ***"
    #if window.playerHp <= 0
        #print "--- YOU LOSE... ---"
        
module.exports = state