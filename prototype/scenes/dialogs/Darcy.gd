extends CanvasLayer
signal end_darcy_speech

func _ready():
	pass # Replace with function body.

func start():
	$ChatBox.start()
	
func end_speech():
	emit_signal("end_darcy_speech", "word_choice")
