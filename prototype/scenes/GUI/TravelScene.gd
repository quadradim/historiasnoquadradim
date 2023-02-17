extends CanvasLayer

signal end_travel_scene
var locked_veicles = [1,0,1]

func _ready():
	pass # Replace with function body.

func _on_RuralWillysButton_pressed():
	if bool(locked_veicles[0]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "taguatinga_introduction")
	pass # Replace with function body.

func _on_ZebrinhaButton_pressed():
	if bool(locked_veicles[1]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "level2")
	pass # Replace with function body.

func _on_BrasiliaButton_pressed():
	if bool(locked_veicles[2]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "episode_intro")
	pass # Replace with function body.
