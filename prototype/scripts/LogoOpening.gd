extends Node2D

onready var transition_animation = $TransitionAnimation

func _ready():
	transition_animation.play("logo_fade_in")

func _on_Duration_timeout():
	get_tree().change_scene("res://scenes/GUI/Menu.tscn")

func _on_TransitionAnimation_animation_finished(anim_name):
	transition_animation.play("logo_fade_out")
