extends CanvasLayer
var player_data

signal end_chefe_de_policia_dialog

func _ready(): #habilidade voltou da cena suzana (que foi sugerido pela cris)
	$Timer.start()
	$PlayerBackPack/DiaryInventory._ready()
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("ability",[1,1,1,1,1,0,0,0,0])

#	$PlayerBackPack/DiaryInventory._ready()
	$Fade_Popup.popup()
	$UnlockedSkill.popup()
	$UnlockedSkillAnimation.play("Popmenssage")

func _on_Timer_timeout():
	$UnlockedSkillAudio.play()
	
func _on_ChatBox_end_dialog():
	var j = get_node("/root/Global")
	j.counter = 4
	emit_signal("end_chefe_de_policia_dialog","Taguatinga")



