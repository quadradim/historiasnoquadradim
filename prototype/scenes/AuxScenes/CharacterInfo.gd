extends Node2D

export(Resource) var character_image
export(String) var character_name
export(String) var character_class
export(String) var character_description

func _ready():
	$Image.apply_scale(Vector2(0.8, 0.8))
	$Name.text = character_name
	$Description.text = 'Description:'+character_description

func set_name(name):
	character_name = name
	
func set_decription(description):
	character_description = description
	
func set_class(c_class):
	character_class = c_class
