extends CanvasLayer


func _ready():
	pass # Replace with function body.

func _on_Area2D_mouse_entered():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")
