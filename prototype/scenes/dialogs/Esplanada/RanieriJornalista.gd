extends CanvasLayer

signal end_ranieri_jornalista_dialog
var player_data

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	pass # Replace with function body.


func _on_ChatBox_end_dialog():
	$PopWindow.popup()


func _on_PopWindow_popup_hide():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",7)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_ranieri_jornalista_dialog","israel_professora_dialog")
