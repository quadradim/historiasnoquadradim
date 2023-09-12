extends Control

export(String, FILE) var chat_res
export(String, MULTILINE) var chat
signal end_dialog
signal new_dialog
signal Display
signal change_face1
signal change_face2
signal change_face3
signal change_face4
signal close_chat

export (Array, Resource) var img
export (Array, String) var cha
export (Array, Vector2) var image_scales
export (Array, String) var nam
export (Array, Vector2) var resize_panel

var profile_image_indices = []
var text_position = 0
var current_text_pos = 0
var current_text = ''
var current_dialog = []
var image_scale = {}
var line_counter = 0

export(bool) var has_profile
export(bool) var chat2

#func load_file(file_src):
#	var file = File.new()
#	file.open(file_src, File.READ)
#	var dialog = ""
#	while not file.eof_reached():
#		var is_character_line = false
#		var current_line = file.get_line()
#		for i  in  range (len(cha)):
#			if cha[i] == current_line:
#				line_counter += 1
#				profile_image_indices.append(i)
#				is_character_line = true
#				if dialog != "":
#					current_dialog.append(dialog)
#					dialog = ""
#		if is_character_line == false:
#			dialog += current_line
#	if len(dialog) > 0:
#		current_dialog.append(dialog)
#	file.close()

func load_chat(entire_chat):
	entire_chat = entire_chat.split('*')
	var dialog = ""
	while line_counter < len(entire_chat):
		var is_character_line = false
		var current_line = entire_chat[line_counter]
		for i  in  range (len(cha)):
			if cha[i] == current_line:
				line_counter += 1
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
	$Writting_Timer.start()

func reset_current_text():
	$ChatText.text = ''
	current_text = ''
	current_text_pos = 0
	
func setChat(var a):
	chat = a
	
func _ready():
#	image_scale[0] = Vector2(0.05,0.05)
#	image_scale[1] = Vector2(0.175,0.175)
#	load_file(str(chat_res))
	load_chat(chat)
	if has_profile and chat2 == false:
		if cha[profile_image_indices[text_position]] == "P":
			$MainCharacterChatBox.visible = true
			$SupportingCharacterChatBox.visible = false
		else:
			$MainCharacterChatBox.visible = false
			$SupportingCharacterChatBox.visible = true
			$SupportingCharacterChatBox/ProfileImages/Panel/Label.text = nam[profile_image_indices[text_position]]
			$SupportingCharacterChatBox/ProfileImages.display(
				img[profile_image_indices[text_position]],
				image_scales[profile_image_indices[text_position]],
				resize_panel[profile_image_indices[text_position]]
			)
	elif chat2:
		$MainCharacterChatBox.visible = false
		$SupportingCharacterChatBox/ProfileImages/Panel/Label.text = nam[profile_image_indices[text_position]]
		$SupportingCharacterChatBox/ProfileImages.display(
				img[profile_image_indices[text_position]],
				image_scales[profile_image_indices[text_position]],
				resize_panel[profile_image_indices[text_position]]
			)
	else:
		hide_profile()

func hide_profile():
	has_profile = false
	$SupportingCharacterChatBox/ProfileImages.hide()
	$Next.hide()
	$Back.hide()

func start():
	$Timer.start()

func Time_to_write():
	if text_position < len(current_dialog) \
	and current_text_pos < len(current_dialog[text_position]):
		current_text += current_dialog[text_position][current_text_pos]
		current_text_pos += 1
		$ChatText.text = current_text
	elif has_profile == false:
		$NextButton.visible = true
	$Timer.start()
		
		

func next_dialog():
	if text_position < line_counter/2 -1:
		reset_current_text()
		text_position += 1
		if text_position == 1:
			emit_signal("change_face2")
		if text_position == 3:
			emit_signal("change_face1")
		if text_position == 5:
			emit_signal("change_face3")
		if text_position == 7:
			emit_signal("change_face2")
		if text_position == 9:
			emit_signal("change_face4")
		if has_profile and chat2 == false:
			if len(profile_image_indices) > text_position and cha[profile_image_indices[text_position]] == "P":
				$MainCharacterChatBox.visible = true
				$SupportingCharacterChatBox.visible = false
			else:
				$MainCharacterChatBox.visible = false
				$SupportingCharacterChatBox.visible = true
				$SupportingCharacterChatBox/ProfileImages/Panel/Label.text = nam[profile_image_indices[text_position]]
				$SupportingCharacterChatBox/ProfileImages.display(
					img[profile_image_indices[text_position]],
					image_scales[profile_image_indices[text_position]],
					resize_panel[profile_image_indices[text_position]]
				)
		elif chat2:
			$SupportingCharacterChatBox.visible = true
			$SupportingCharacterChatBox/ProfileImages/Panel/Label.text = nam[profile_image_indices[text_position]]
			$SupportingCharacterChatBox/ProfileImages.display(
					img[profile_image_indices[text_position]],
					image_scales[profile_image_indices[text_position]],
					resize_panel[profile_image_indices[text_position]]
				)
		emit_signal("new_dialog")
	else:
		emit_signal("end_dialog")

func previous_dialog():
	if text_position > 0:
		reset_current_text()
		text_position -= 1
		
		if has_profile and chat2 == false:
			if cha[profile_image_indices[text_position]] == "P":
				$MainCharacterChatBox.visible = true
				$SupportingCharacterChatBox.visible = false
			else:
				$MainCharacterChatBox.visible = false
				$SupportingCharacterChatBox.visible = true
				$SupportingCharacterChatBox/ProfileImages/Panel/Label.text = nam[profile_image_indices[text_position]]
				$SupportingCharacterChatBox/ProfileImages.display(
					img[profile_image_indices[text_position]],
					image_scales[profile_image_indices[text_position]],
					resize_panel[profile_image_indices[text_position]]
				)
		elif chat2:
			$SupportingCharacterChatBox.visible = true
			$SupportingCharacterChatBox/ProfileImages/Panel/Label.text = nam[profile_image_indices[text_position]]
			$SupportingCharacterChatBox/ProfileImages.display(
					img[profile_image_indices[text_position]],
					image_scales[profile_image_indices[text_position]],
					resize_panel[profile_image_indices[text_position]]
				)

func _on_Writting_Timer_timeout():
	Time_to_write()
	pass # Replace with function body.

func _on_NextButton_button_down():
	emit_signal("close_chat")
	pass # Replace with function body.
