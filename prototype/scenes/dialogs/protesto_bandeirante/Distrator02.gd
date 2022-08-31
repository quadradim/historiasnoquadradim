extends CanvasLayer

signal distractor_dialog

func _ready():
	pass
	
func end_distractor_dialog():
	emit_signal("distractor_dialog", "multidao")

func start():
	$ChatBox.start()
