extends CanvasLayer

signal distractor_selected

func _ready():
	pass
	
func distractor1_pressed():
	emit_signal("distractor_selected", "distractor1_darcy")

func distractor2_pressed():
	emit_signal("distractor_selected", "distractor2_darcy")

func distractor3_pressed():
	emit_signal("distractor_selected", "distractor3_darcy")

func _process(delta):
	$MainMusic.update("soundtrack")
	
func play_music():
	return $MainMusic
