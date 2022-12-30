extends Node2D

var player_data

func get_historiometer_image(level):
	return "res://assets/Images/Composition/Historiometer/%s.png" % level

func _ready():
	player_data = $Player.read()

func _process(delta):
	$Status.texture = load(
		get_historiometer_image(str(player_data['historiometer']))
	)
