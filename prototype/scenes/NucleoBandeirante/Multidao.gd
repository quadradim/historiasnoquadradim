extends CanvasLayer

signal distractor_selected
onready var dist = get_node("/root/Global")
var counter = 0
func _ready():
	counter = dist.distratores
	if counter == 2:
		$ButtonDist3/Dist3.modulate = Color(1,1,1)
	pass
	
func distractor1_pressed():
	emit_signal("distractor_selected", "distractor1_darcy")

func distractor2_pressed():
	if counter ==1:
		emit_signal("distractor_selected", "distractor2_darcy")

func distractor3_pressed():
	if counter ==2:
		emit_signal("distractor_selected", "distractor3_darcy")

func _process(delta):
	$MainMusic.update("soundtrack")
	
func play_music():
	return $MainMusic
