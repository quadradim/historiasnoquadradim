extends CanvasLayer

signal end_ranieri_jornalista_dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChatBox_end_dialog():
	$PopWindow.popup()
	pass # Replace with function body.


func _on_PopWindow_popup_hide():
	emit_signal("end_ranieri_jornalista_dialog","israel_professora_dialog")
	pass # Replace with function body.
