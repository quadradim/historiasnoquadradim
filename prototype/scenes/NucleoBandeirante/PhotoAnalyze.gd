extends CanvasLayer

var player_data
signal end_analyze
var clues = 0

func _ready():
	player_data = $Player.read()
	print(player_data)
	$MinigameExplanation.popup()
	$InstructionAnimation.play("Instruction")
	$Button.disabled = true

func next_image():
	if $PhotoPanel/PhotoOne.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = true

func previous_image():
	if $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = true
		$PhotoPanel/PhotoTwo.visible = false

func _on_MinigameExplanation_popup_hide():
	$Title.visible = true

func _on_FirstButton_button_down():
	if $PhotoPanel/PhotoOne/FirstClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/FirstClue.visible = true
	$PhotoPanel/PhotoTwo/FirstClue.visible = true
	$ClueMensage/Label.text = ("Está um tempo nublado/fechado, em que época de Brasília o clima fica assim? São poucos os meses de chuva. Os períodos comuns de chuva em Brasília são de março até maio ou de setembro até outubro.")
	$ClueMensage.popup()

func _on_SecoondButton_button_down():
	if $PhotoPanel/PhotoOne/SecondClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/SecondClue.visible = true
	$ClueMensage/Label.text = ("Observe que a placa está destruída, amassada ao chão e o que está escrito nela. Na placa está escrito prefeitura, mas o que se tem nesse período na capital são subprefeituras, pois as prefeituras são criadas somente após a reestruturação administrativa do Distrito Federal com a LEI Nº 4.545, DE 10 DE DEZEMBRO DE 1964.")
	$ClueMensage.popup()

func _on_ThirdButton_button_down():
	if $PhotoPanel/PhotoOne/ThirdClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/ThirdClue.visible = true
	$PhotoPanel/PhotoTwo/ThirdClue.visible = true
	$ClueMensage/Label.text = ("A grande multidão que destruiu a subprefeitura rasgou vários papéis importantes para a administração da região. Entretanto, não são quaisquer papéis. São fontes documentais marcantes relacionados à construção da capital. ")
	$ClueMensage.popup()

func _on_FourthButton_button_down():
	if $PhotoPanel/PhotoOne/FourthClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/FourthClue.visible = true
	$PhotoPanel/PhotoTwo/FourthClue.visible = true
	$ClueMensage/Label.text = ("A caixa de água que aparece em uma imagem no telhado mas não aparece em outra, é somente perspectiva? Ou será que ela foi levada pelos manifestantes? ")
	$ClueMensage.popup()

func _on_UnlockedSkill_popup_hide():
	$Player.modifier("ability",[1,0,0,0,0,0,0,0,0])
	$Player.modifier("historiometer",0)

#	$PlayerBackPack/DiaryInventory._ready()


func _on_ClueMensage_popup_hide():
	if clues == 4:
		clues += 1
		$Button.disabled = false
		$Fade_Popup.popup()
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")


func _on_Button_button_down():
	emit_signal("end_analyze", "lavadeiras")
	pass # Replace with function body.
