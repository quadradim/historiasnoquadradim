extends CanvasLayer
var player_data
signal end_raulino_dialog

func _ready():
	$Timer.start()
	player_data = $Player.read()
	$Player.modifier("ability",[1,1,1,1,1,1,0,0,0])
#	$PlayerBackPack/DiaryInventory._ready()
	$Fade_Popup.popup()
	$UnlockedSkill.popup()
	$UnlockedSkillAnimation.play("Popmenssage")

func _on_Timer_timeout():
	$UnlockedSkillAudio.play()
	
func _process(delta):
	$MainMusic.update("soundtrack")

func _on_ChatBox_end_dialog():
	$Player.modifier("characters",4)
	emit_signal("end_raulino_dialog","folheto_raulino")



