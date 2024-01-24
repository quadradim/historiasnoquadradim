extends CanvasLayer

var player_data
signal end_analyze2
var correct = 0
var a

func _ready():
	player_data = $Player.read()
	print(player_data)
	$MinigameExplanation.popup()
	$InstructionAnimation.play("Instruction")
	$Button.disabled = true
	$Next.disabled = true

func next_image():
	$Next.disabled = true
	if $PhotoPanel/PhotoOne.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = true
		$PhotoPanel/PhotoThree.visible = false
		if correct == 3:
			$ThirdQuestion.visible = false
			$FourthQuestion.popup()
	elif $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = false
		$PhotoPanel/PhotoThree.visible = true
		if correct == 5:
			$FifthQuestion.visible = false
			$SixthQuestion.visible = true
			$SixthQuestion/SixthAnswer.disabled = false
			$SixthQuestion/WrongAnswer.disabled = false
			$SixthQuestion/WrongAnswer2.disabled = false


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
	$FirstQuestion.visible = true
	$FirstQuestion/FirstAnswer.disabled = false
	$SecondQuestion/SecondAnswer.disabled = true
	$ThirdQuestion/ThirdAnswer.disabled = true
	$FifthQuestion/FifthAnswer.disabled = true

func _on_FirstAnswer_button_down():
	correct += 1
	$FirstQuestion/FirstAnswer/Sprite.visible = true
	$ClueMensage/Label.text = ("resposta correta, agora a proxima pergunta")
	$ClueMensage.popup()
	$FirstQuestion/FirstAnswer.disabled = true
	$FirstQuestion/WrongAnswer.disabled = true
	$FirstQuestion/WrongAnswer2.disabled = true
	$SecondQuestion/SecondAnswer.disabled = false
	$SecondQuestion/WrongAnswer.disabled = false

func _on_SecondAnswer_button_down():
	correct += 1
	$SecondQuestion/SecondAnswer/Sprite.visible = true
	$ClueMensage/Label.text = ("Resposta correta, agora a proxima pergunta")
	$ClueMensage.popup()
	$SecondQuestion/SecondAnswer.disabled = true
	$SecondQuestion/WrongAnswer.disabled = true
	$ThirdQuestion/ThirdAnswer.disabled = false
	$ThirdQuestion/WrongAnswer.disabled = false

func _on_ThirdAnswer_button_down():
	correct += 1
	$ThirdQuestion/ThirdAnswer/Sprite.visible = true
	$ClueMensage/Label.text = ("Muito bom, vamos para a proxima imagem")
	$ClueMensage.popup()
	$ThirdQuestion/ThirdAnswer.disabled = true
	$ThirdQuestion/WrongAnswer.disabled = true
	$Next.disabled = false
	

func _on_FourthQuestion_popup_hide():
	correct += 1
	$FifthQuestion.visible = true
	$FifthQuestion/FifthAnswer.disabled = false
	$FifthQuestion/WrongAnswer.disabled = false


func _on_FifthAnswer_button_down():
	correct += 1
	$FifthQuestion/FifthAnswer/Sprite.visible = true
	$ClueMensage/Label.text = ("Muito bom, vamos para a proxima imagem")
	$ClueMensage.popup()
	$FifthQuestion/FifthAnswer.disabled = true
	$FifthQuestion/WrongAnswer.disabled = true
	$Next.disabled = false
	
func _on_SixthAnswer_button_down():
	correct += 1
	$SixthQuestion/SixthAnswer/Sprite.visible = true
	$ClueMensage/Label.text = ("Parabéns você acertou todas as perguntas!")
	$ClueMensage.popup()

	
func _on_UnlockedSkill_popup_hide():
	$Player.modifier("ability",[1,1,0,0,0,0,0,0,0])
	$Player.modifier("historiometer",0)

#	$PlayerBackPack/DiaryInventory._ready()

func _on_ClueMensage_popup_hide():
	if correct == 6:
		$Button.disabled = false
		$Fade_Popup.popup()
		$UnlockedSkillAudio.play()
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
	elif correct == 1:
		$FirstQuestion.visible = false
		$SecondQuestion.visible = true
	elif correct == 2:
		$SecondQuestion.visible = false
		$ThirdQuestion.visible = true


func _on_Button_button_down():
	emit_signal("end_analyze2", "intro_multidao")
	pass # Replace with function body.


func _on_WrongAnswer_button_down():
	$WrongAnswerMessage.popup()

func _on_WrongAnswer1_button_down():
	$FirstQuestion/WrongAnswer/Sprite.visible = true

func _on_WrongAnswer2_button_down():
	$FirstQuestion/WrongAnswer2/Sprite.visible = true

func _on_WrongAnswer3_button_down():
	$SecondQuestion/WrongAnswer/Sprite.visible = true

func _on_WrongAnswer4_button_down():
	$ThirdQuestion/WrongAnswer/Sprite.visible = true

func _on_WrongAnswer5_button_down():
	$FifthQuestion/WrongAnswer/Sprite.visible = true

func _on_WrongAnswer6_button_down():
	$SixthQuestion/WrongAnswer/Sprite.visible = true

func _on_WrongAnswer7_button_down():
	$SixthQuestion/WrongAnswer2/Sprite.visible = true
