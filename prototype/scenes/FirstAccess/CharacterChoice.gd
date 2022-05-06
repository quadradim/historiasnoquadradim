extends CanvasLayer

var num_selected = []
var items = []

export(Resource) var image_source

signal end_choice

func _ready():
	$TabContainer/Habilities/Abiliity.texture = image_source
	$TabContainer/Habilities/AbiliityDescription.text = "Pikachu"
	items.append($TabContainer/Habilities/HabilityPanel/img1)
	items.append($TabContainer/Habilities/HabilityPanel/img2)
	items.append($TabContainer/Habilities/HabilityPanel/img3)
	items.append($TabContainer/Habilities/HabilityPanel/img4)
	items.append($TabContainer/Habilities/HabilityPanel/img5)
	items.append($TabContainer/Habilities/HabilityPanel/img6)
	items.append($TabContainer/Habilities/HabilityPanel/img7)
	items.append($TabContainer/Habilities/HabilityPanel/img8)
	items.append($TabContainer/Habilities/HabilityPanel/img9)

	var sizeto=Vector2(400,400)
	var size=image_source.get_size()
	var scale_factor=sizeto/size
	$TabContainer/Habilities/Abiliity.scale=scale_factor

func choose_an_object(object_source,description):
	$TabContainer/Habilities/Abiliity.texture = object_source
	$TabContainer/Habilities/AbiliityDescription.text = description
	for item in items:
		if num_selected.size() < 3:
			if object_source == item.get_image():
				if object_source in num_selected:
					num_selected.erase(object_source)
					item.unselect_object()
				else:
					num_selected.append(object_source)
					item.select_object()
				break
		elif object_source in num_selected and object_source == item.get_image():
			num_selected.erase(object_source)
			item.unselect_object()
			break
	print(object_source)

func end_character_choice():
	emit_signal("end_choice")

