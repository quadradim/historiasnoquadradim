extends CanvasLayer

signal end_access01
var animation_finish = false
var discover = false

func _ready():
	$Control/NoteArea/Message.hide()
	$Control/MagnifierArea/Magnifier.scale = Vector2(0.08, 0.08)
	$Control/NoteArea/Note.scale = Vector2(0,0)

func click_magnifier(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT and not discover:
		$AnimationPlayer.play("MagnifierMove")
		discover = true

func magnifier_move_finished(anim_name):
	$Control/NoteArea/Message.show()
	if not animation_finish:
		$AnimationPlayer.play("MagnifierClicked")
	else:
		$AnimationPlayer.play_backwards("MagnifierClicked")
	animation_finish = not animation_finish

func next_scene(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("end_access01")
