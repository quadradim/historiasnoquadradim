extends CanvasLayer

signal end_suzana_scene
var player_data
# Called when the node enters the scene tree for the first time.
func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	pass # Replace with function body.

func _process(delta):
	$MainMusic.update("soundtrack")

func play_music():
	return $MainMusic

func _on_ChatBox_new_dialog():
	$ChatBox.get_text()

func start():
	$ChatBox.start()

func end_suzana_scene():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",1)
	
	
	$PlayerBackPack/DiaryInventory._ready()
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("ability",[1,0,0,0,0,0,1,0,1])

#	$PlayerBackPack/DiaryInventory._ready()
	$Fade_Popup.popup()
	$UnlockedSkill.popup()
	$UnlockedSkillAnimation.play("Popmenssage")


func _on_UnlockedSkill_popup_hide():
	emit_signal("end_suzana_scene", "analyze_photos2")
