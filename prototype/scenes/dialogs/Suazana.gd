extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ChatBox_new_dialog():
	print($ChatBox.get_text())
