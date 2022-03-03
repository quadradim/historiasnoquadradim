extends CanvasLayer

export(Resource) var image_source

func _ready():
	$TabContainer/Habilidades/Abiliity.texture = image_source
	$TabContainer/Habilidades/AbiliityDescription.text = "Pikachu"
	pass # Replace with function body.
	
func choose_an_object(object_source,description):
	$TabContainer/Habilidades/Abiliity.texture = object_source
	$TabContainer/Habilidades/AbiliityDescription.text = description
	
	print(object_source)
