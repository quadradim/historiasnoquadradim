extends CanvasLayer

signal end_chefe_de_policia_dialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChatBox_end_dialog():
	var j = get_node("/root/Global")
	j.counter = 4
	emit_signal("end_chefe_de_policia_dialog","Taguatinga")
	pass # Replace with function body.
