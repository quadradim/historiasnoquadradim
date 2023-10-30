extends CanvasLayer

signal end_ranieri_jornalista_dialog
var player_data
var i = 0

func _ready():
	player_data = $Player.read()
	
func _process(delta):
	$MainMusic.update("soundtrack")

func _on_ChatBox_end_dialog():
	$PopWindow.popup()

func _on_PopWindow_popup_hide():
	$Player.modifier("characters",7)
#	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_ranieri_jornalista_dialog","israel_professora_dialog")


func _on_ChatBox_start_chat():
	$CharacterZoom.play("Zoom1")
	pass # Replace with function body.
	


func _on_ChatBox_next_dialog():
	i+=1
	$CharacterZoom.seek(0,true)
	if($ChatBox.cha[$ChatBox.profile_image_indices[i]]) == "J":
		$CharacterZoom.play("Zoom1")
	if($ChatBox.cha[$ChatBox.profile_image_indices[i]]) == "R":
		$CharacterZoom.play("Zoom2") 
	pass # Replace with function body.


func _on_ChatBox_previous_dialog():
	i-=1
	$CharacterZoom.seek(0,true)
	if($ChatBox.cha[$ChatBox.profile_image_indices[i]]) == "J":
		$CharacterZoom.play("Zoom1")
	if($ChatBox.cha[$ChatBox.profile_image_indices[i]]) == "R":
		$CharacterZoom.play("Zoom2") 
	pass # Replace with function body.
