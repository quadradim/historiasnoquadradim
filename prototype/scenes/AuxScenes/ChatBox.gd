extends Control

export(String, FILE) var chat_res
signal end_dialog
signal new_dialog
signal Display

export (Array, Resource) var img
export (Array, String) var cha
export (Array, Vector2) var image_scales

var profile_image_indices = []
var text_position = 0
var current_text_pos = 0
var current_text = ''
var current_dialog = []
var image_scale = {}
var line_counter = 0

export(bool) var has_profile

func load_file(file_src):
	var file = File.new()
	file.open(file_src, File.READ)
	var dialog = ""
	while not file.eof_reached():
		var is_character_line = false
		var current_line = file.get_line()
		for i  in  range (len(cha)):
			if cha[i] == current_line:
				print(cha[i])
				profile_image_indices.append(i)
				is_character_line = true
				if dialog != "":
					current_dialog.append(dialog)
					dialog = ""
		if is_character_line == false:
			dialog += current_line
			line_counter += 1
	if len(dialog) > 0:
		current_dialog.append(dialog)
	file.close()

func reset_current_text():
	$ChatText.text = ''
	current_text = ''
	current_text_pos = 0

func _ready():
#	image_scale[0] = Vector2(0.05,0.05)
#	image_scale[1] = Vector2(0.175,0.175)
	
	load_file(str(chat_res))
	if has_profile:
		print(profile_image_indices[text_position])
		$ProfileImages.display(
			img[profile_image_indices[text_position]],
			image_scales[profile_image_indices[text_position]]
#			Vector2(0.05,0.05)
		)

func hide_profile():
	has_profile = false
	$ProfileImages.hide()

func start():
	$Timer.start()

func Time_to_write():
	if text_position < len(current_dialog) \
	and current_text_pos < len(current_dialog[text_position]):
		current_text += current_dialog[text_position][current_text_pos]
		current_text_pos += 1
		$ChatText.text = current_text
	$Timer.start()

func next_dialog():
	if text_position < line_counter-1:
		reset_current_text()
		text_position += 1
		
		if has_profile:
			$ProfileImages.display(
				img[profile_image_indices[text_position]],
				image_scales[profile_image_indices[text_position]]
#				image_scale[profile_image_indices[text_position]]
			)
		
		emit_signal("new_dialog")
	else:
		emit_signal("end_dialog")

func previous_dialog():
	if text_position > 0:
		reset_current_text()
		text_position -= 1
		
		if has_profile:
			$ProfileImages.display(
				img[profile_image_indices[text_position]],
				image_scales[profile_image_indices[text_position]]
#				image_scale[profile_image_indices[text_position]]
			)
