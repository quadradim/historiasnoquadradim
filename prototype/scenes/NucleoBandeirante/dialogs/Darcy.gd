extends CanvasLayer
signal end_darcy_speech
var player_data

signal start_audio
signal next_audio
signal start_chat

func _ready():
	$ChatBox/Writting_Timer.stop()
	player_data = $Player.read()
	$ChatBox.visible = false

func start():
	$MessageBox.popup()
	
func _on_MessageBox_popup_hide():
	$ChatBox.visible = true
	$ChatBox._on_Writting_Timer_timeout()
	emit_signal("start_audio")

func end_speech():
	$Player.modifier("characters",2)
	$PlayerBackPack/DiaryInventory._ready()

	emit_signal("end_darcy_speech", "word_choice")

func _process(delta):
	$MainMusic.update("soundtrack")

func play_music():
	return $MainMusic

func next_dialog():
	emit_signal("next_audio")



