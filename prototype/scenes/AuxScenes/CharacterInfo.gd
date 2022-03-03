extends Node2D

export(Resource) var character_image
export(String) var character_name
export(String) var character_class
export(String) var character_description

func update_info():
	$Image.texture = character_image
	$Name.text = character_name
	$Description.text = 'Description:'+character_description
	
func _ready():
	$Image.apply_scale(Vector2(0.8, 0.8))
	update_info()

func _process(delta):
	update_info()

func set_name(name):
	character_name = name
	
func set_description(description):
	character_description = description

func set_class(c_class):
	character_class = c_class

func set_image(image_src):
	character_image = image_src
