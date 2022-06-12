extends CanvasLayer

signal end_travel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TextureButton_button_down():
	print("dale")
	get_tree().change_scene("res://scenes/Levels/NúcleoBandeirante.tscn")
	pass # Replace with function body.


func _on_GoToTagua_button_down():
	get_tree().change_scene("res://scenes/Levels/Taguatinga.tscn")
	print("dele")
	pass # Replace with function body.

func _on_GoToEsplanada_button_down():
	get_tree().change_scene("res://scenes/Levels/Esplanada.tscn")
	print("dolly")
	pass # Replace with function body.

func _on_Button_gui_input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		print('Exit Travel Scene')
		emit_signal("end_travel")
