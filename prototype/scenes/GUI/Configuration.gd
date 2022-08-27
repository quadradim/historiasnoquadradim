extends CanvasLayer

signal exit_button

func _ready():
	pass # Replace with function body.

func get_soundeffect():
	return $PanelConfig/Soundeffect

func get_soundtrack():
	return $PanelConfig/Soundtrack

func button_pressed():
	emit_signal("exit_button")
