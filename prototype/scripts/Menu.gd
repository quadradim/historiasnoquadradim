extends Node

onready var transition_animation = $OpeningAnimation

func _ready():
	$OpeningAnimation.play("menu_fade_in")


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func _on_MapButton_pressed():
	get_tree().change_scene("res://scenes/GUI/Map.tscn")
