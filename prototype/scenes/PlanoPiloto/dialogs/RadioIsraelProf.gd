extends CanvasLayer


signal end_radio_israel_prof
signal start_audio
# Called when the node enters the scene tree for the first time.
func _ready():
	$RadioBeforeClick.visible = true
	$RadioAfterClick.visible = false
	$ChatBox.visible = false

func _on_TextureButton_pressed():
	$RadioBeforeClick.visible = false
	$RadioAfterClick.visible = true
	$TextureButton.disabled = true
	emit_signal("start_audio")
	$Timer.start()

func _on_Timer_timeout():
	$ChatBox.visible = true

func _on_ChatBox_end_dialog():
	emit_signal("end_radio_israel_prof","word_selection_2")
