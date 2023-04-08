extends CanvasLayer

signal end_israel_professora_dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_data

# Called when the node enters the scene tree for the first time.
func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChatBox_end_dialog():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",6)
	$PlayerBackPack/DiaryInventory._ready()
	emit_signal("end_israel_professora_dialog","word_selection_2")
	pass # Replace with function body.
