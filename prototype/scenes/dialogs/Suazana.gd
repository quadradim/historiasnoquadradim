extends CanvasLayer

signal end_suzana_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$MainMusic.update("soundtrack")
	
func play_music():
	return $MainMusic

func _on_ChatBox_new_dialog():
	$ChatBox.get_text()
	
func start():
	$ChatBox.start()

func end_suzana_scene():
	emit_signal("end_suzana_scene", "intro_multidao")
