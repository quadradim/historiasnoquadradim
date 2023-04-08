extends CanvasLayer
signal end_darcy_speech
var player_data

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()

func start():
	$ChatBox.start()
	
func end_speech():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",2)
	$PlayerBackPack/DiaryInventory._ready()

	emit_signal("end_darcy_speech", "word_choice")

func _process(delta):
	$MainMusic.update("soundtrack")

func play_music():
	return $MainMusic
