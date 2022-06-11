extends CanvasLayer

var num_selected = []
var items = []
var style = false

export(Resource) var image_source
signal end_choice

func _ready():
	# Panel Style Settings
	style = StyleBoxFlat.new()
	style.set_bg_color(Color('#f8e16f'))
	style.set_corner_radius_all(5)
	
	var hability_panel = get_node("TabContainer/Habilidades/HabilityPanel")
	hability_panel.set('custom_styles/panel', style)
	
	var sizeto=Vector2(200,200)
	var size=image_source.get_size()
	var scale_factor=sizeto/size
	#$TabContainer/Habilidades/Abiliity.scale=scale_factor

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

func end_character_choice():
	emit_signal("end_choice")

