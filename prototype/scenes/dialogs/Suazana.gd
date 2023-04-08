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
#	$PlayerBackPack/DiaryInventory/PlayerEntitiy.insert(
#	{
#		"name": player_data["name"],
#		"habilities": player_data["habilities"],
#		"backpack": player_data["backpack"],
#		"ability": [1,0,0,0,0,0,0,0,0],
#		"historiometer":3,
#		"characters":1,
#		"soundtrack": player_data["soundtrack"],
#		"soundeffect": player_data["soundeffect"]
#	}
#)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_suzana_scene", "intro_multidao")




	pass # Replace with function body.



