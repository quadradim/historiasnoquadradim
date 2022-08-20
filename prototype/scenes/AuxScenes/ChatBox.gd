extends Control

export(String, FILE) var chat_res
signal end_dialog
signal player_dialog
signal suzana_dialog

var text_position = 0
var current_text_pos = 0
var current_text = ''
var current_dialog = []

func load_file(file_src):
	var file = File.new()
	file.open(file_src, File.READ)
	var dialog = ""
	while not file.eof_reached():
		var current_line = file.get_line()
		if current_line == "*P*":
			emit_signal("player_dialog")
			current_dialog.append(dialog)
			dialog = ""
		elif current_line == "*S*":
			emit_signal("suzana_dialog")
			current_dialog.append(dialog)
			dialog = ""
		else:
			dialog += current_line
	if len(dialog) > 0:
		current_dialog.append(dialog)
	file.close()

func reset_current_text():
	$ChatText.text = ''
	current_text = ''
	current_text_pos = 0

func _ready():
	load_file(str(chat_res))

func Time_to_write():
	if text_position < len(current_dialog) \
	and current_text_pos < len(current_dialog[text_position]):
		current_text += current_dialog[text_position][current_text_pos]
		current_text_pos += 1
		$ChatText.text = current_text
	else:
		emit_signal("end_dialog")
	$Timer.start()

func next_dialog():
	if text_position < len(current_dialog):
		reset_current_text()
		text_position += 1
	else:
		emit_signal("end_dialog")

func previous_dialog():
	if text_position > 0:
		reset_current_text()
		text_position -= 1

#func get_text():
#	return current_dialog[text_position]
