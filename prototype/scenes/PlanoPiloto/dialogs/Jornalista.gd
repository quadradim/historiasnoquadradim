extends CanvasLayer
signal end_jornalista_dialog
var player_data
var i = 0

func _ready():
	player_data = $Player.read()
	
func _process(delta):
	$MainMusic.update("soundtrack")

func _on_ChatBox_end_dialog():
	$Player.modifier("ability",[1,1,1,1,1,1,1,1,1])
		
#	$PlayerBackPack/DiaryInventory._ready()
	$Fade_Popup.popup()
	$UnlockedSkillAudio.play()
	$UnlockedSkill.popup()
	$UnlockedSkillAnimation.play("Popmenssage")

func _on_UnlockedSkill_popup_hide():
	emit_signal("end_jornalista_dialog", "retrospectiva")


func _on_ChatBox_start_chat():
	$CharacterZoom.play("Zoom1")
	pass # Replace with function body.


func _on_ChatBox_next_dialog():
	i+=1
	$CharacterZoom.seek(0,true)
	if($ChatBox.cha[$ChatBox.profile_image_indices[i]]) == "J":
		$CharacterZoom.play("Zoom1")


func _on_ChatBox_previous_dialog():
	i-=1
	$CharacterZoom.seek(0,true)
	if($ChatBox.cha[$ChatBox.profile_image_indices[i]]) == "J":
		$CharacterZoom.play("Zoom1")



