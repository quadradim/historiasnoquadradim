extends CanvasLayer

var player_data
signal end_analyze2
var correct = 0


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
		if correct == 3:
			$FourthQuestion.popup()
	elif $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = false
		$PhotoPanel/PhotoThree.visible = true
		if correct == 5:
			$SixthQuestion.popup()

func previous_image():
	if $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = true
		$PhotoPanel/PhotoTwo.visible = false
		$PhotoPanel/PhotoThree.visible = false
	elif $PhotoPanel/PhotoThree.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = true
		$PhotoPanel/PhotoThree.visible = false

func _on_MinigameExplanation_popup_hide():
	$FirstQuestion.popup()
	$FirstQuestion/FirstAnswer.disabled = false
	$SecondQuestion/SecondAnswer.disabled = true
	$ThirdQuestion/ThirdAnswer.disabled = true
	$FifthQuestion/FifthAnswer.disabled = true

func _on_FirstAnswer_button_down():
	correct += 1
	$ClueMensage/Label.text = ("resposta correta, agora a proxima pergunta")
	$ClueMensage.popup()
	$FirstQuestion/FirstAnswer.disabled = true
	$SecondQuestion/SecondAnswer.disabled = false

func _on_SecondAnswer_button_down():
	correct += 1
	$ClueMensage/Label.text = ("Resposta correta, agora a proxima pergunta")
	$ClueMensage.popup()
	$SecondQuestion/SecondAnswer.disabled = true
	$ThirdQuestion/ThirdAnswer.disabled = false

func _on_ThirdAnswer_button_down():
	correct += 1
	$ClueMensage/Label.text = ("Muito bom, vamos para a proxima imagem")
	$ClueMensage.popup()
	$ThirdQuestion/ThirdAnswer.disabled = true

func _on_FourthQuestion_popup_hide():
	correct += 1
	$FifthQuestion.popup()
	$FifthQuestion/FifthAnswer.disabled = false

func _on_FifthAnswer_button_down():
	correct += 1
	$ClueMensage/Label.text = ("Muito bom, vamos para a proxima imagem")
	$ClueMensage.popup()
	$FifthQuestion/FifthAnswer.disabled = true

func _on_SixthAnswer_button_down():
	correct += 1
	$ClueMensage/Label.text = ("Parabéns você acertou todas as perguntas!")
	$ClueMensage.popup()

func _on_UnlockedSkill_popup_hide():
	$Player.modifier("ability",[1,0,0,0,0,0,1,0,0])
	$Player.modifier("historiometer",0)

#	$PlayerBackPack/DiaryInventory._ready()

func _on_ClueMensage_popup_hide():
	if correct == 6:
		$Button.disabled = false
		$Fade_Popup.popup()
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
	elif correct == 1:
		$SecondQuestion.popup()
	elif correct == 2:
		$ThirdQuestion.popup()


func _on_Button_button_down():
	emit_signal("end_analyze2", "intro_multidao")
	pass # Replace with function body.
