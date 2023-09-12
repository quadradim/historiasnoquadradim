extends CanvasLayer

signal end_folheto_raulino
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var text_tutorials = ['Caderninho de contas de Raulino \nGastos de hoje \n \n1000 Cruzeiros 10 pães \n5000 cruzeiros 1kg de arroz \n Saldo final 100 Cruzeiros']

# Called when the node enters the scene tree for the first time.
var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0

func write_text():
	pass

func _ready():
	$FinishWriting.start()
	$WritingTime.start()
	$Continuar.disabled = true

func _on_WritingTime_timeout():
	if current_text_pos < len(text_tutorials[text_position]) and self.layer != -1:
		current_text += text_tutorials[text_position][current_text_pos]
		current_text_pos += 1
		$TutorialText.text = current_text
	$WritingTime.start()

func start_writing():
	$WritingTime.start()

func _on_FinishWriting_timeout():
	$Continuar.disabled = false

func _on_Continuar_button_down():
	if presses_count < text_tutorials.size() - 1:
		$TutorialText.text = ''
		text_position+=1
		current_text = ''
		current_text_pos = 0
		presses_count += 1
		$Continuar.disabled = true
		$FinishWriting.start()
	else:
		emit_signal("end_folheto_raulino","travel_scene")
