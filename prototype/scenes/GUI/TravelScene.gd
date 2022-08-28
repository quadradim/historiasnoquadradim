extends CanvasLayer

signal end_travel_scene
var locked_veicles = [1,0,0]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RuralWillysButton_pressed():
	if bool(locked_veicles[0]) == false:
		$MessageBox/MessageText.text = "O veículo selecionado não está disponível"
		$MessageBox.popup()
	else:
		emit_signal("end_travel_scene", "level1")
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
		emit_signal("end_travel_scene", "level3")
	pass # Replace with function body.
