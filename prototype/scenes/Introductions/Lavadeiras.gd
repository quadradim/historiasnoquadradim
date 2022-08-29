extends CanvasLayer

signal introd_lava

func _ready():
	pass

func end_introduction(scene):
	emit_signal("introd_lava", scene)
