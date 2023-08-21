extends CanvasLayer

var player_data
signal end_analyze2
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
		$PhotoPanel/PhotoThree.visible = false
	elif $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = false
		$PhotoPanel/PhotoThree.visible = true

func previous_image():
	if $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = true
		$PhotoPanel/PhotoTwo.visible = false
		$PhotoPanel/PhotoThree.visible = false
	elif $PhotoPanel/PhotoThree.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = true
		$PhotoPanel/PhotoThree.visible = false

func exit():
	emit_signal("end_analyze2", "intro_multidao")

func _on_MinigameExplanation_popup_hide():
	$Title.visible = true

func _on_FirstButton_button_down():
	if $PhotoPanel/PhotoOne/FirstClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/FirstClue.visible = true
	$ClueMensage/Label.text = ("Há um hotel pequeno, com a presença de mulheres.")
	$ClueMensage.popup()

func _on_SecoondButton_button_down():
	if $PhotoPanel/PhotoOne/SecondClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/SecondClue.visible = true
	$ClueMensage/Label.text = ("Observe a expressão dos trabalhadores.")
	$ClueMensage.popup()

func _on_ThirdButton_button_down():
	if $PhotoPanel/PhotoTwo/ThirdClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoTwo/ThirdClue.visible = true
	$ClueMensage/Label.text = ("Parece haver um palanque improvisado, e estas pessoas parecem se vestir de maneira diferente das outras.")
	$ClueMensage.popup()

func _on_FourthButton_button_down():
	if $PhotoPanel/PhotoThree/FourthClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoThree/FourthClue.visible = true
	$ClueMensage/Label.text = ("Observando mais de perto vemos que quem esta discursando é Darcy Ribeiro, chefe da Casa Civil do Governo João Goulart")
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

