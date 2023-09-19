extends CanvasLayer

signal end_raulino2_dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ChatBox_end_dialog():
	emit_signal("end_raulino2_dialog","cronica_raulino")
