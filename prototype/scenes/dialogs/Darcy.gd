extends CanvasLayer
signal end_darcy_speech
var player_data

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	pass # Replace with function body.

func start():
	$ChatBox.start()
	
func end_speech():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.insert(
	{
		"name": player_data["name"],
		"habilities": player_data["habilities"],
		"backpack": player_data["backpack"],
		"ability": [1,0,0,0,0,0,0,0,0],
		"historiometer":3,
		"characters":1,
		"soundtrack": player_data["soundtrack"],
		"soundeffect": player_data["soundeffect"]
	}
)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_darcy_speech", "word_choice")

func _process(delta):
	$MainMusic.update("soundtrack")

func play_music():
	return $MainMusic
