Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

fieldData = require '../data/field'
playerData = require '../data/player'

state = {}

state.create = ->
    fieldData.init()
    playerData.init()
    
    root = new Node; fieldData.root = root
    game.world.add root
    root.edge.destroy()
    root.createChildren 4
    GraphUtils.arrangeNodes [root]
    for n in root.getChildren 4
        game.world.add n
    enemyTimer = game.time.create()
    playerData.hp = 100
    timerFunction = ->
        hpLost = 10
        hpLost /= 2 if playerData.blocking
        playerData.blocking = false
        playerData.hp -= hpLost
        print "Player HP: #{playerData.hp}"
        enemyTimer.add 2000, timerFunction
    enemyTimer.add 2000, timerFunction
    enemyTimer.start()
    fieldData.enemyHp = 100

state.update = ->
    #if window.enemyHp <= 0
        #print "*** YOU WIN!!!! ***"
    #if window.playerHp <= 0
        #print "--- YOU LOSE... ---"
        
module.exports = state