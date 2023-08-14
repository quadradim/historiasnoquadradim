extends CanvasLayer

signal end_lavadeira

func _ready():
	pass

func end_scene_dialog():
	emit_signal("end_lavadeira", "lavadeiras")
	
func start():
	$ChatBox.start()
	
func play_music():
	return $MainMusic
