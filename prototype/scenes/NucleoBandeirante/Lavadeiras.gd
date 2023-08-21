extends CanvasLayer

signal end_lavadeira

func _ready():
	$PlayerBackPack.visible = true
	$MessageBox.popup()
	pass # Replace with function body.

func _process(delta):
	$MainMusic.update("soundtrack")

func suzana_dialog():
	emit_signal("end_lavadeira", "suzana")

func distratora_dialog():
	emit_signal("end_lavadeira", "lavadeira_amiga")

func play_music():
	return $MainMusic

func replay_audio():
	$MainMusic.play()
