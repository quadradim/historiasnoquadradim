extends Node2D

export(String) var player_name = 'Player'
export(String) var player_desc = 'None'
export(Array, String) var player_habilities

func _ready():
	pass # Replace with function body.

func get_name():
	return player_name

func get_description():
	return player_desc
	
func get_habilities():
	return player_habilities
