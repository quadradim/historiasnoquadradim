extends CanvasLayer
var player_data
signal end_israel_dialog

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()

func _on_ChatBox_end_dialog():
	$PopWindow.popup()

func _on_PopWindow_popup_hide():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",5)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_israel_dialog","ranieri_jornalista_dialog")
