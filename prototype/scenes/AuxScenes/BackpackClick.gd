extends Node2D

signal clicked_in_backpack

func _ready():
	pass

func pressed_in_backpack():
	emit_signal("clicked_in_backpack", "diary_previous")
