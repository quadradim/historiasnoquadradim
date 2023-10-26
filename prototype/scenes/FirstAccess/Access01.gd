extends CanvasLayer

signal end_access01
var animation_finish = false
var discover = false

func _ready():
	$Control/MagnifierArea/Magnifier.scale = Vector2(0.08, 0.08)
	$Control/NoteArea/Note.scale = Vector2(0,0)
	$FirstAccessMessage.popup()
	$PopUpPlayer.play("Dale")

func _process(delta):
	$MainMusic.update("soundtrack")

func click_magnifier(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT and not discover:
		$AnimationPlayer.play("MagnifierMove")
		discover = true

func magnifier_move_finished(anim_name):
	$Control/NoteArea.visible = true
	
	if not animation_finish:
		$AnimationPlayer.play("MagnifierClicked")
	else:
		$AnimationPlayer.play_backwards("MagnifierClicked")
	animation_finish = not animation_finish

func next_scene(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("end_access01", "access02")
		
func play_music():
	return $MainMusic
	
func main_music_finished():
	$MainMusic.play()


func _on_TextureButton_pressed():
	$Control/MagnifierArea.visible = true
	pass # Replace with function body.
