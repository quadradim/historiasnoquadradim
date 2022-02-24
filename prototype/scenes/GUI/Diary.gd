extends CanvasLayer

func _ready():
	pass


func _on_Mapa_gui_input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		$AbaMapa.layer = 1
		$Mapa.color = '#ff0000'
