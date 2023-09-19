extends CanvasLayer

var id_item_selected = []
var selected_backpack = false

export(Resource) var image_source
signal end_choice

var player_data

func _ready():	
	$FirstAccessMessage.popup()
	$PopUp.play("popup")
	# Get Current Data
	player_data = $PlayerEntity.read()
	
	# Message Box text style
	$MessageBox/MessageText.add_color_override("font_color", Color('#000000'))
	
	# Backpack Text
	$TabContainer/Estilo/BackpackText.add_color_override("font_color", Color('#7e888e'))
	
	# Button starts disabled
	$ContinueButton.set_disabled(false)
	
	# Panel Style Settings
	var historian_style = StyleBoxFlat.new()
	historian_style.set_bg_color(Color('#f1eee7'))
	historian_style.set_corner_radius_all(5)
	
	var hability_panel = get_node("TabContainer/Habilidades/CreationPanel")
	hability_panel.set('custom_styles/panel', historian_style)
	
	var style_panel = get_node("TabContainer/Estilo/CreationPanel")
	style_panel.set('custom_styles/panel', historian_style)
	
	# Object Selected with Zoom
	#90b9e1, 66a1dc
	var historian_object_zoom_style = StyleBoxFlat.new()
	historian_object_zoom_style.set_bg_color(Color('#f1eee7'))
	historian_object_zoom_style.set_corner_radius_all(5)
	historian_object_zoom_style.set_border_width_all(7)
	historian_object_zoom_style.set_border_color(Color('#66a1dc'))
	
	var historian_object_zoom = get_node("TabContainer/Habilidades/HabilityZoomImage")
	historian_object_zoom.set('custom_styles/panel', historian_object_zoom_style)

func _process(delta):
	$MainMusic.update("soundtrack")

# Deactivate Button if not defined	
#func _process(delta):
#	if id_item_selected.size() == 3 and selected_backpack:
#		$ContinueButton.set_disabled(false)
#	else:
#		$ContinueButton.set_disabled(true)
	
func choose_an_hability(object_id, object_source,object_name,description):
	$TabContainer/Habilidades/HabilityZoomImage/HabiliityImage.texture = object_source
	$TabContainer/Habilidades/HabilityZoomImage/HabilityZoomImageName/HabilityName.text = object_name
	$TabContainer/Habilidades/HabilityZoomImage/HabilityDescriptionPanel/HabilityDescription.text = description
	
	if object_id in id_item_selected:
		object_id.unselect_object()
		id_item_selected.erase(object_id)
	elif id_item_selected.size() < 3:
		object_id.select_object()
		id_item_selected.append(object_id)

func choose_a_backpack(object_id, object_source,object_name,description):
	if not selected_backpack:
		selected_backpack = object_id
	selected_backpack.unselect_object()
	
	selected_backpack = object_id
	selected_backpack.select_object()
	
	$TabContainer/Estilo/BackpackZoom.texture = object_source
	$BackPackSound.play()
	$BackPackShake.play("BackPackShake")




func play_music():
	return $MainMusic
	
func music_finished():
	$MainMusic.play()


func _on_ContinueButton_button_down():
	if id_item_selected.size() < 0:
		$MessageBox/MessageText.text = "Selecione mais {items} habilidade(s)".format(
			{"items": 3-id_item_selected.size()}
		)
		$MessageBox.popup()
	elif not selected_backpack:
		$MessageBox/MessageText.text = "Selecione uma mochila"
		$MessageBox.popup()
	elif len($PlayerName.text) < 3:
		$MessageBox/MessageText.text = "O nome necessita de no mínimo 3 caracteres"
		$MessageBox.popup()
	else:
		var items_selected_info = []
		for item in id_item_selected:
			items_selected_info.append([item.get_image_path(), item.object_name])
		
		$PlayerEntity.insert(
			{
				"name": $PlayerName.text,
				"habilities": items_selected_info,
				"backpack": $TabContainer/Estilo/BackpackZoom.texture.resource_path,
				"ability": [0,0,0,0,0,0,0,0,0],
				"historiometer":0,
				"characters":0,
				"soundtrack": player_data["soundtrack"],
				"soundeffect": player_data["soundeffect"],
				"audio_description": player_data["audio_description"],
				"current_scene": "production"
			}
		)
		print($PlayerEntity.read())
		emit_signal("end_choice", "diary")
	pass # Replace with function body.
