extends Area2D

export(Resource) var char_src
export(String) var char_name
export(String) var char_info

signal character_clicked(char_src, char_name, char_info)

func _ready():
	$Image.apply_scale(Vector2(0.8, 0.8))
	$Image.texture = char_src
	#$Background1.color = '#efeded'

func clicked_character(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		#$Background1.color = '#000000'
		emit_signal("character_clicked", char_src, char_name, char_info)

func get_name():
	return char_name
	
func get_info():
	return char_info
	
func get_image():
	return char_src
