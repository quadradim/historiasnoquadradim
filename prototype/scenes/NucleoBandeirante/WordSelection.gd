extends CanvasLayer
var player_choice = []
var correct_choice = ["Greve","Reivindicação","Desempregados"]
var errors_counter = 0
var player_data

signal end_word_selection

func _ready():
	var veicles = get_node("/root/Global")
	veicles.locked_veicles[0] = 1
	player_data = $Player.read()
	$TryButton.disabled = true
	$NextButton.disabled = true

func word1_button():
	var font = $Word1.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word1.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word1.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word2_button():
	var font = $Word2.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word2.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word2.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word3_button():
	var font = $Word3.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word3.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word3.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word4_button():
	var font = $Word4.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word4.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word4.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word5_button():
	var font = $Word5.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word5.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word5.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word6_button():
	var font = $Word6.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word6.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word6.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word7_button():
	var font = $Word7.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word7.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word7.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func word8_button():
	var font = $Word8.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word8.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word8.text)
	if len(player_choice) >= 3:
		$TryButton.disabled = false
	else:
		$TryButton.disabled = true
	print(player_choice)

func _on_MessageBox_popup_hide():
	if $MessageBox/MessageText.text == "Resposta correta, parabéns. Mas Como começou a depredação da Subprefeitura do Núcleo Bandeirante?":
		$MessageBox/MessageText.text = "A depredação da SubPrefeitura teve início após a reivindicação de trabalhadores que prestavam serviços à NOVACAP e se definiram como 'turma da boa vontade', por não receberem seus salários há muitos meses. Se somaram aos desempregados que já estavam revoltados em Taguatinga. Então o povo se juntou e já anunciava a greve, quando a repressão da GEB começou. Se instalou então o Levante da Turma da Boa Vontade. Os próximos dias serão intensos."
		$MessageBox.popup()
	elif $MessageBox/MessageText.text == "A depredação da SubPrefeitura teve início após a reivindicação de trabalhadores que prestavam serviços à NOVACAP e se definiram como 'turma da boa vontade', por não receberem seus salários há muitos meses. Se somaram aos desempregados que já estavam revoltados em Taguatinga. Então o povo se juntou e já anunciava a greve, quando a repressão da GEB começou. Se instalou então o Levante da Turma da Boa Vontade. Os próximos dias serão intensos.":
		$NextButton.disabled = false
		$Fade_Popup.popup()
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")

func _on_TryButton_button_down():
	print(correct_choice)
	if len(player_choice) == 3 and player_choice[0] in correct_choice and player_choice[1] in correct_choice and player_choice[2] in correct_choice:
		$InstructionText.hide()
		$MessageBox/MessageText.text = "Resposta correta, parabéns. Mas Como começou a depredação da Subprefeitura do Núcleo Bandeirante?"
		$MessageBox.popup()
		$NextButton.disabled = false
		$TryButton.disabled = true
		#$UnlockedSkill.popup()
		$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("ability",[1,0,0,1,0,1,1,0,1])
		$PlayerBackPack/DiaryInventory._ready()
	else:
		errors_counter +=1
		if errors_counter >= 3:
			var help_player = []
			for i in len(player_choice):
				if bool(player_choice[i] in correct_choice) == false:
					help_player.append(player_choice[i])
			print(help_player)
			if len(help_player) > 1:
				help_player = str(help_player).replace('[', '').replace(']', '')
				$MessageBox/MessageText.text = "As palavras "+ (help_player) + " estão incorretas"
			else:
				help_player = str(help_player).replace('[', '').replace(']', '')
				$MessageBox/MessageText.text = "A palavra "+ (help_player) + " está incorreta"
			$MessageBox.popup()
		else:
			$MessageBox/MessageText.text = "Resposta incorreta, tente novamente"
			$MessageBox.popup()
			
	pass # Replace with function body.


func _on_NextButton_button_down():
	emit_signal("end_word_selection","travel_scene")
	pass # Replace with function body.
