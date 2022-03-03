extends Control

export(Resource) var object_source

signal clicked_object(object_source)

func _ready():
	$Image.apply_scale(Vector2(0.8, 0.8))
	$Image.texture = object_source

func get_image():
	return object_source
	
func click_object(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("clicked_object", object_source)
