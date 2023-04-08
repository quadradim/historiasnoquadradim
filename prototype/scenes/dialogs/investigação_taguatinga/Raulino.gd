extends CanvasLayer
var player_data
signal end_raulino_dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("ability",[1,0,1,1,0,0,0,1,1])
#	$PlayerBackPack/DiaryInventory/PlayerEntitiy.insert(
#	{
#		"name": player_data["name"],
#		"habilities": player_data["habilities"],
#		"backpack": player_data["backpack"],
#		"ability": [1,0,1,1,0,0,0,1,1],
#		"historiometer":5,
#		"characters":1,
#		"soundtrack": player_data["soundtrack"],
#		"soundeffect": player_data["soundeffect"]
#	}
#)
	$PlayerBackPack/DiaryInventory._ready()
	$UnlockedSkill.popup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChatBox_end_dialog():
	$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("characters",4)
	emit_signal("end_raulino_dialog","folheto_raulino")
	pass # Replace with function body.
