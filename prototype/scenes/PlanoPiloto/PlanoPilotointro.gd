extends CanvasLayer

signal end_plano_piloto_intro
signal start_audio
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$PopWindow.popup()
	pass # Replace with function body.

func _process(delta):
	$MainMusic.update("soundtrack")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_IsraelButton_pressed():
	emit_signal("end_plano_piloto_intro","israel_dialog")
	pass # Replace with function body.


func _on_StartAudio_timeout():
	emit_signal("start_audio")
	pass # Replace with function body.
