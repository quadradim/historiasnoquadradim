extends Node

onready var transition_animation = $TransitionAnimation

func _ready():
	transition_animation.play("production_fade_in")

func _on_OpeningDuration_timeout():
	get_tree().change_scene("res://scenes/GUI/LogoOpening.tscn")
