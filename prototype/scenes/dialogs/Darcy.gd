extends CanvasLayer
signal end_darcy_speech

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ChatBox.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func end_speech():
	emit_signal("end_darcy_speech", "word_choice")
	pass # Replace with function body.
