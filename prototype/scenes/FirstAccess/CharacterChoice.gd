extends CanvasLayer

var num_selected = []
var items = []

export(Resource) var image_source

func _ready():
	$TabContainer/Habilidades/Abiliity.texture = image_source
	$TabContainer/Habilidades/AbiliityDescription.text = "Pikachu"
	items.append($TabContainer/Habilidades/img1)
	items.append($TabContainer/Habilidades/img2)
	items.append($TabContainer/Habilidades/img3)
	items.append($TabContainer/Habilidades/img4)
	items.append($TabContainer/Habilidades/img5)
	items.append($TabContainer/Habilidades/img6)
	items.append($TabContainer/Habilidades/img7)
	items.append($TabContainer/Habilidades/img8)
	items.append($TabContainer/Habilidades/img9)

func choose_an_object(object_source,description):
	$TabContainer/Habilidades/Abiliity.texture = object_source
	$TabContainer/Habilidades/AbiliityDescription.text = description
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




