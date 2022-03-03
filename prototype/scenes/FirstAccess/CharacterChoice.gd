extends CanvasLayer

export(Resource) var image_source

func _ready():
	$TabContainer/Habilidades/Abiliity.texture = image_source
	pass # Replace with function body.
	
func choose_an_object(object_source):
	$TabContainer/Habilidades/Abiliity.texture = object_source
	print(object_source)
