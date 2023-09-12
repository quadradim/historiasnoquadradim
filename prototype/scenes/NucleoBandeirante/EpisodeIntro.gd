extends CanvasLayer

signal end_episode_intro
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal start_audio
# Called when the node enters the scene tree for the first time.
func _ready():
	$EnableButton.start()
	$StartVideo.start()
	$NextButton.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_EnableButton_timeout():
	$NextButton.disabled = false
	pass # Replace with function body.

	
	
func _on_StartVideo_timeout():
	$VideoPlayer.play()
	$PauseVideo.start()
	emit_signal("start_audio")
	pass # Replace with function body.



func _on_PauseVideo_timeout():
	$VideoPlayer.paused = true
	pass # Replace with function body.




func _on_NextButton_button_down():
	emit_signal("end_episode_intro", "introd_lavadeiras")
	pass # Replace with function body.
