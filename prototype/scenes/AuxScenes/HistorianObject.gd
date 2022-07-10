extends Control

export(Resource) var object_source
export(String) var description
signal clicked_object(object_source,description)

func _ready():
	$Image.scale = Vector2(1, 1)
	$Image.texture = object_source
	
func get_image():
	return object_source
	
func click_object(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("clicked_object", object_source,description)
		
func select_object():
	$Background.color = '#d0a473'
func unselect_object():
	$Background.color = '#fef8dd'
