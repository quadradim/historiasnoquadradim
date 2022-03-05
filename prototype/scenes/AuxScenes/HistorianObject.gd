extends Control

export(Resource) var object_source
export(String) var description
signal clicked_object(object_source,description)

func _ready():
	$Image.scale = Vector2(0.5, 0.5)
	$Image.texture = object_source
	
func get_image():
	return object_source
	
func click_object(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("clicked_object", object_source,description)
		
func select_object():
	$Background.color = '#d5c2ff'
func unselect_object():
	$Background.color = '#fef8dd'
		
