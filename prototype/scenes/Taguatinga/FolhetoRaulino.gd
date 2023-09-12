extends CanvasLayer

signal end_folheto_raulino
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0
var text_tutorials = ['Crônica do livro: “Um solitário à espreita” de Milton Hatoum.',
'UM ILUSTRE REFUGIADO POLÍTICO',
'[...] Me lembrei do poema “Brasília enigmática”, de Nicolas Behr:',
'Brasília, faltam exatos 3232 dias',
'para o nosso acerto de contas',
'me deves um poema',
'te devo um olhar terno',
'na beira do Paranoá pego um pedaço de pau',
'entre um pneu velho e um peixe morto',
'(uma garça por testemunha)',
'não me reconheces',
'não te reconheço.']

# Called when the node enters the scene tree for the first time.
func _ready():
	var veicles = get_node("/root/Global")
	veicles.locked_veicles[1] = 1
	$WritingTime.start()
	pass # Replace with function body.

func _on_WritingTime_timeout():
	if current_text_pos < len(text_tutorials[text_position]) and self.layer != -1:
		current_text += text_tutorials[text_position][current_text_pos]
		current_text_pos += 1
		$TutorialText1.text = current_text
	$WritingTime.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Continuar_button_down():
	emit_signal("end_folheto_raulino","travel_scene")
	pass # Replace with function body.
