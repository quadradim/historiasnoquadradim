extends Node

signal clicked_object(object_source,description)
export(Resource) var object_source
export(String) var object_name
export(String) var description
var style = false

func _ready():
	# Image Settings
	if !object_source:
		var source = Resource.new()
		source.set_path("res://assets/Images/Composition/CharacterChoice/binoculos.png")
		print(source.get_path())
		object_source = source
		
	$Background/Object.texture = object_source
	$Background/Object.scale = Vector2(1.1, 1.1)
	
	# Background Style Settings
	style = StyleBoxFlat.new()
	style.set_bg_color(Color('#fef8dd'))
	style.set_corner_radius_all(20)
	style.set_border_width_all(4)
	style.set_border_color(Color('#fef8dd'))
	
	var background = get_node("Background")
	background.set('custom_styles/panel', style)

func clicked_object(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("clicked_object", object_source,description)

func select_object():
	style.set_border_color(Color('#d0a473'))
	
func unselect_object():
	style.set_border_color(Color('#fef8dd'))
