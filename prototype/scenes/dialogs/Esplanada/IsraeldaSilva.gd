extends CanvasLayer
var player_data
signal end_israel_dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChatBox_end_dialog():
	$PopWindow.popup()
	pass # Replace with function body.


func _on_PopWindow_popup_hide():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",5)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_israel_dialog","ranieri_jornalista_dialog")
	pass # Replace with function body.
