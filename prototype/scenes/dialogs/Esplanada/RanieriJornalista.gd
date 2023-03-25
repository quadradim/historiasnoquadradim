extends CanvasLayer

signal end_ranieri_jornalista_dialog

func _ready():
	pass # Replace with function body.


func _on_ChatBox_end_dialog():
	$PopWindow.popup()


func _on_PopWindow_popup_hide():
	emit_signal("end_ranieri_jornalista_dialog","israel_professora_dialog")
