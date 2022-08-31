extends CanvasLayer
var player_choice = []
var correct_choice = ["Greve","Reivindicação","Desempregados"]
var errors_counter = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$NextButton.disabled = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func word1_button():
	var font = $Word1.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word1.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word1.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word2_button():
	var font = $Word2.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word2.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word2.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word3_button():
	var font = $Word3.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word3.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word3.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word4_button():
	var font = $Word4.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word4.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word4.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word5_button():
	var font = $Word5.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word5.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word5.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word6_button():
	var font = $Word6.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word6.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word6.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word7_button():
	var font = $Word7.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word7.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word7.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func word8_button():
	var font = $Word8.get("custom_fonts/font")
	if font.outline_size == 2:
		font.outline_size = 0
		player_choice.erase($Word8.text)
	else:
		font.outline_size = 2
		player_choice.push_back($Word8.text)
	if len(player_choice) >= 3:
		$NextButton.disabled = false
	else:
		$NextButton.disabled = true
	print(player_choice)
	pass # Replace with function body.

func next_button():
	print(correct_choice)
	if len(player_choice) == 3 and player_choice[0] in correct_choice and player_choice[1] in correct_choice and player_choice[2] in correct_choice:
		$MessageBox/MessageText.text = "Resposta correta, parabéns"
		$MessageBox.popup()
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
