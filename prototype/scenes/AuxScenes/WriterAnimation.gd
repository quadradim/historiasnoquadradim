extends CanvasLayer

export var text_used = ''
var current_text = ''
var current_text_pos = 0

func _ready():
	$WriterTime.start()

func _on_WriterTime_timeout():
	print('Hello')
	if self.layer != -1 and current_text_pos < len(text_used):
		current_text += text_used[current_text_pos]
		current_text_pos += 1
		$Text.text = current_text
	$WriterTime.start()
