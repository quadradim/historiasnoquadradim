extends CanvasLayer

signal end_israel_professora_dialog

var player_data

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()

func _on_ChatBox_end_dialog():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",6)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_israel_professora_dialog","word_selection_2")
