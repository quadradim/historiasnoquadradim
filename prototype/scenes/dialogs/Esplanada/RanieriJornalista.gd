extends CanvasLayer

signal end_ranieri_jornalista_dialog
var player_data

func _ready():
	player_data = $Player.read()

func _on_ChatBox_end_dialog():
	$PopWindow.popup()

func _on_PopWindow_popup_hide():
	$Player.modifier("characters",7)
#	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_ranieri_jornalista_dialog","israel_professora_dialog")
