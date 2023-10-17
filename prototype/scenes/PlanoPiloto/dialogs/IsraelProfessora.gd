extends CanvasLayer

signal end_israel_professora_dialog

var player_data
var counter = 0

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()

func _on_ChatBox_end_dialog():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",6)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_israel_professora_dialog","word_selection_2")


	

func _on_ChatBox_change_line():
	pass # Replace with function body.


func _on_ChatBox_next_dialog():
	$CharacterZoom.seek(0,true)
	if($ChatBox.cha[$ChatBox.profile_image_indices[$ChatBox.text_position+1]]) == "I":
		$CharacterZoom.play("Zoom1")
	if($ChatBox.cha[$ChatBox.profile_image_indices[$ChatBox.text_position+1]]) == "O":
		$CharacterZoom.play("Zoom2")
	pass # Replace with function body.


func _on_ChatBox_start_chat():
	$CharacterZoom.play("Zoom1")
	pass # Replace with function body.
