extends CanvasLayer

func _ready():
	pass # Replace with function body.

func suzana_dialog():
	emit_signal("end_lavadeira", "suzana")

func distratora_dialog():
	emit_signal("end_lavadeira", "lavadeira_distratora")

func play_music():
	return $MainMusic

func replay_audio():
	$MainMusic.play()