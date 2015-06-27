state = {}

Popup = require '../ui/popup'

TEXT_STYLE =
    fontSize: 30
    fill: 'white'
TEXT_STYLE_SMALLER = Object.create(TEXT_STYLE)
TEXT_STYLE_SMALLER.fontSize = 24
PORTRAIT_Y = 55

selectedHeroText = null
selectedEnemyText = null
selectedHero = null
selectedEnemy = null
popup = null
enemyPopup = null

state.create = ->
    selectedHeroText = null
    selectedEnemyText = null
    selectedHero = null
    selectedEnemy = null
    popup = null
    enemyPopup = null
    heroSelectHeading = game.add.text 400, 30, "Select your Hero:", TEXT_STYLE
    heroSelectHeading.anchor.set 0.5
    noble = game.add.image 150, PORTRAIT_Y, 'noble_portrait'
    noble.heroName = "Noble"
    noble.heroText = "Has mastered the art of the sword to fight with ripostes and feints."
    ninja = game.add.image 350, PORTRAIT_Y, 'ninja_portrait'
    ninja.heroName = 'Ninja'
    ninja.heroText = "Shifts between Yin and Yang to fuel deadly attacks."
    wizard = game.add.image 550, PORTRAIT_Y, 'wizard_portrait'
    wizard.heroName = 'Wizard'
    wizard.heroText = 'Controls the battle with the right spell for every situation.'
    for portrait in [noble, ninja, wizard]
        portrait.inputEnabled = true
        portrait.scale.set 3
        portrait.tint = 0x808080
        portrait.events.onInputOver.add ->
            @tint = 0xffffff
            popup = new Popup @x - 100, @y + 150
            popup.setHeading @heroName
            popup.setText @heroText
        , portrait
        portrait.events.onInputOut.add ->
            @tint = 0x808080
            popup.destroy()
        , portrait
        portrait.events.onInputUp.add ->
            popup?.destroy()
            selectedHero = @
        , portrait
    enemySelectHeading = game.add.text 400, 330, "Select an Opponent:", TEXT_STYLE
    enemySelectHeading.anchor.set 0.5
    kobold = game.add.text 150, 360, "Kobold", TEXT_STYLE_SMALLER
    kobold.enemyText = "A strong, stupid opponent from the Eastern caves."
    naga = game.add.text 380, 360, "Naga", TEXT_STYLE_SMALLER
    naga.enemyText = "A horrific snake creature that poisons, constricts, and drains health."
    titan = game.add.text 550, 360, "Titan", TEXT_STYLE_SMALLER
    titan.enemyText = "Mighty stone being from the mountains that can rend the earth beneath you."
    for enemyText in [kobold, naga, titan]
        enemyText.tint = 0x808080
        enemyText.inputEnabled = true
        enemyText.events.onInputOver.add ->
            @tint = 0xFF8080
            enemyPopup = new Popup @x - 100, @y + 20
            enemyPopup.setHeading @text
            enemyPopup.setText @enemyText
        , enemyText
        enemyText.events.onInputOut.add ->
            @tint = 0x808080
            enemyPopup.destroy()
        , enemyText
        enemyText.events.onInputUp.add ->
            enemyPopup?.destroy()
            selectedEnemy = @text
        , enemyText
    selectedHeroText = game.add.text 100, 510, "Selected Hero: none", TEXT_STYLE
    selectedEnemyText = game.add.text 100, 550, "Selected Opponent: none", TEXT_STYLE

state.update = ->
    if selectedHero
        selectedHeroText?.setText "Selected Hero: #{selectedHero.heroName}"
    if selectedEnemy
        selectedEnemyText?.setText "Selected Opponent: #{selectedEnemy}"
    if selectedHero and selectedEnemy
        game.selectedHero = selectedHero
        game.selectedEnemy = selectedEnemy
        game.state.start 'main'

module.exports = state