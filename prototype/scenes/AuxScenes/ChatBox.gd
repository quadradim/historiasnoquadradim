extends Control


#export(String) var chat_text 
export(String, FILE) var chat_res

var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0

var current_dialog = []

signal new_dialog

func write_text():
	pass
	
func load_file(file_src):
	var file = File.new()
	file.open(file_src, File.READ)
	
	var dialog = ""
	
	while not file.eof_reached():
		var current_line = file.get_line()
		if current_line == "**":
			current_dialog.append(dialog)
			dialog = ""
		else:
			dialog += current_line
	file.close()

func _ready():
	load_file(str(chat_res))
	emit_signal("new_dialog")
		
func Time_to_write():
	if current_text_pos < len(current_dialog[text_position]) :
		current_text += current_dialog[text_position][current_text_pos]
		current_text_pos += 1
		$ChatText.text = current_text
	$Timer.start()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Button2_pressed():
	if presses_count < current_dialog.size() - 1:
		$ChatText.text = ''
		text_position+=1
		current_text = ''
		current_text_pos = 0
		presses_count += 1
		emit_signal("new_dialog")
	else:
		print('dale')
	pass #
	
func _on_Back_pressed():
	if presses_count != 0:
		$ChatText.text = ''
		text_position-=1
		current_text = ''
		current_text_pos = 0
		presses_count -= 1

	pass #

func get_text():
	return current_dialog[text_position]
