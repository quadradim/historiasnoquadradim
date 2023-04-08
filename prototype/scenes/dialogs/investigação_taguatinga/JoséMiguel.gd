extends CanvasLayer

signal end_jose_dialog
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
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",3)
	$PlayerBackPack/DiaryInventory._ready()
	var j = get_node("/root/Global")
	j.counter = 2
	emit_signal("end_jose_dialog","Taguatinga")
	pass # Replace with function body.
