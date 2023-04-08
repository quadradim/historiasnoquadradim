extends CanvasLayer
var player_data
signal end_raulino_dialog

func _ready():
	player_data = $Player.read()
	$Player.modifier("ability",[1,0,1,1,0,0,0,1,1])

#	$PlayerBackPack/DiaryInventory._ready()
	$UnlockedSkill.popup()

func _on_ChatBox_end_dialog():
	$Player.modifier("characters",4)
	emit_signal("end_raulino_dialog","folheto_raulino")
