extends CanvasLayer

signal end_introduction

export(String, MULTILINE) var text
export(String) var next_scene

func _ready():
	$Text.text = text

func next_scene():
	emit_signal("end_introduction", next_scene)
