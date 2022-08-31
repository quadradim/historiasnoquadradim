extends Node

signal clicked_object(object_id, object_source, object_name, description)

var object_id
export(Resource) var object_source
#export(Resource) var object_source_zoom
export(String) var object_name
export(String, MULTILINE) var description
var style = false

func _ready():
	object_id = self
	
	# Image Settings
	if !object_source:
		var source = Resource.new()
		source.set_path("res://assets/Images/Composition/CharacterChoice/binoculos.png")
		print(source.get_path())
		object_source = source
		
	$Background/Object.texture = object_source
	$Background/Object.scale = Vector2(1, 1)
	
	# Background Style Settings
	style = StyleBoxFlat.new()
	style.set_bg_color(Color('#f8e16f'))
	style.set_corner_radius_all(20)
	style.set_border_width_all(10)
	style.set_border_color(Color('#f8e16f'))
	
	var background = get_node("Background")
	background.set('custom_styles/panel', style)

func clicked_object(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("clicked_object", object_id, object_source, object_name, description)

func select_object():
	style.set_border_color(Color('#d0a473'))
	
func unselect_object():
	style.set_border_color(Color('#f8e16f'))

func get_image_path():
	return $Background/Object.texture.resource_path
