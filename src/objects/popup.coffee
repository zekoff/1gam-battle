class Popup extends Phaser.Group

    @_heading = null
    @_text = null

    constructor: ->
        super game
        background = @create 0, 0, 'line'
        background.width = 300
        background.height = 200
        background.alpha = 0.5
        @_heading = game.make.text 10, 10, "Ability Name", {
            fill: 'black'
            fontSize: 18
            fontWeight: 'bold'
        }
        @add @_heading
        @_text = game.make.text 10, 40, "Ability text", {
            fill: 'black'
            fontSize: 14
            wordWrap: true
            wordWrapWidth: 280
        }
        @add @_text
    
    setHeading: (heading) ->
        @_heading.setText heading
        
    setText: (text) ->
        @_text.setText text
        
module.exports = Popup