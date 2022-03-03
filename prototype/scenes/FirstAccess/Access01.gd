extends CanvasLayer

signal end_access01

func _ready():
	$Control/NoteArea/Message.hide()

func click_magnifier(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		$AnimationPlayer.play("MagnifierMove")

func magnifier_move_finished(anim_name):
	$Control/NoteArea/Message.show()

func next_scene(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("end_access01")
