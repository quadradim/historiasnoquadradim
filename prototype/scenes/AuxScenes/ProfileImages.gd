extends Node2D

func _ready():
	pass
	
func display(image, scale_def):
	$Image.scale = scale_def
	$Image.texture = image

func _on_ChatBox_suzana_dialog():
	pass
