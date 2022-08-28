extends AudioStreamPlayer

signal end_lavadeiras

func _ready():
	pass # Replace with function body.

func update(type_audio):
	var player_data = $Player.read()
	self.set_volume_db(player_data[type_audio])
