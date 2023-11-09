extends CanvasLayer

signal distractor_dialog

func _ready():
	pass
	
func end_distractor_dialog():
	var c = get_node("/root/Global")
	c.distratores = 2
	emit_signal("distractor_dialog", "multidao")

func start():
	$ChatBox.start()
