extends CanvasLayer

signal end_multidao
var dialog_number = 0

func _ready():
	$ChatBox.hide_profile()
	$Image02.hide()

func new_dialog_text():
	dialog_number += 1
	if dialog_number == 1:
		$Transition.play("Transition")

func multidao_end_scene():
	emit_signal("end_multidao", "multidao")

func start():
	$ChatBox.start()
