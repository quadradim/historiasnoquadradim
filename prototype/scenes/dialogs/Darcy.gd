extends CanvasLayer
signal end_darcy_speech
var player_data

signal start_audio
signal next_audio

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()

func start():
	$ChatBox.start()
	emit_signal("start_audio")
	
func end_speech():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",2)
	$PlayerBackPack/DiaryInventory._ready()

	emit_signal("end_darcy_speech", "word_choice")

func _process(delta):
	$MainMusic.update("soundtrack")

func play_music():
	return $MainMusic

func next_dialog():
	emit_signal("next_audio")
