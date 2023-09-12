extends CanvasLayer

signal introd_lava

func _ready():
	pass



func _on_Next_button_down():
	emit_signal("introd_lava", "analyze_photos")
	pass # Replace with function body.
