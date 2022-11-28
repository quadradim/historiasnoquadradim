extends Node2D

func _ready():
	pass
	
func display(image, scale_def, size_panel):
	$Image.scale = scale_def
	$Image.texture = image
	$Panel.rect_size = size_panel

func _on_ChatBox_suzana_dialog():
	pass
