extends CanvasLayer

var text_tutorials = ['Quando clicar em iniciar ou recomeçar, o/a jogador(a) será levado ao cenário principal em que consta o mapa do distrito federal, ambientado em uma Brasília histórica.']
var text_position = 0
var current_text_pos = 0
var current_text = ''

func write_text():
	pass

func _ready():
	pass # Replace with function body.

func _on_WritingTime_timeout():
	if current_text_pos < len(text_tutorials[text_position]):
		current_text += text_tutorials[text_position][current_text_pos]
		current_text_pos += 1
		$TutorialText.text = current_text
	$WritingTime.start()
