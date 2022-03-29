extends Control


export(String) var chat_text 

var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0


func write_text():
	pass

func _ready():
	pass # Replace with function body.
		
func Time_to_write():
	if current_text_pos < len(chat_text[text_position]) :
		current_text += chat_text[text_position][current_text_pos]
		current_text_pos += 1
		$ChatText.text = current_text
	$Timer.start()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Button2_pressed():
	if presses_count < chat_text.size() - 1:
		$ChatText.text = ''
		text_position+=1
		current_text = ''
		current_text_pos = 0
		presses_count += 1
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



	pass # Replace with function body.
