extends CanvasLayer

signal end_travel_scene
onready var veicles = get_node("/root/Global")

func _ready():
	$MessageBox.popup()
	if bool(veicles.locked_veicles[1]) == true:
		$ZebrinhaBloqueada.visible = false
	if bool(veicles.locked_veicles[0]) == true:
		$RuralWillysBloqueada.visible = false
	$CarSoundEffect.play()
	
func _process(delta):
	$CarSoundEffect.update("soundeffect")
	
func _on_RuralWillysButton_pressed():
	if bool(veicles.locked_veicles[0]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "taguatinga_introduction")
	pass # Replace with function body.

func _on_ZebrinhaButton_pressed():
	if bool(veicles.locked_veicles[1]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "plano_piloto_intro")
	pass # Replace with function body.

func _on_BrasiliaButton_pressed():
	if bool(veicles.locked_veicles[2]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "episode_intro")


