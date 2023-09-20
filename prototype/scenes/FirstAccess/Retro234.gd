extends Node
signal end_retrospectiva

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0

var text1 = ['Taguatinga surgiu pela resistência de pessoas migrantes que foram impedidas de entrar na Cidade Livre (atual Núcleo Bandeirante), essa localidade foi reconhecida em junho de 1958, a partir de uma estratégia de mobilização dos moradores.',
'Nascendo com data marcada para deixar de existir (abril de 1960), moradores resistiram na Cidade Livre, atual Núcleo Bandeirante', 
'Em 1964, pioneiros e pioneiras se organizavam para exigir a fixação daquele núcleo pioneiro.',
'Por trabalharem há meses sem receber salários, nos arredores da SubPrefeitura, trabalhadores começaram a se identificar como "a turma da boa vontade".',
'Desde o início de sua existência, a Esplanada dos Ministérios é palco de manifestações populares, recebendo multidões que reivindicam direitos.',
'Em 1964, os jornais noticiam que a população do Distrito Federal ocupou a Esplanada em oposição ao chamado movimento retornista e em defesa da permanência de Brasília como capital.',
'Por outro lado, algumas notícias e entrevistas de parlamentares revelam que essa não era uma possibilidade e nem pauta de reuniões nas comissões da câmara dos deputados.', 
'A realidade é que essas reivindicações estavam relacionadas às promessas aos trabalhadores não cumpridas pelo Governo.']


# Called when the node enters the scene tree for the first time.
func _ready():
	$PhotoPanel/MensagePanel.visible = true
	$PhotoPanel/MensagePanel/WritingTime.start()

func _on_WritingTime_timeout():
	if current_text_pos < len(text1[text_position]) and self.layer != -1:
		current_text += text1[text_position][current_text_pos]
		current_text_pos += 1
		$PhotoPanel/MensagePanel/Label.text = current_text
	$PhotoPanel/MensagePanel/WritingTime.start()
	
func start_writing():
	$PhotoPanel/MensagePanel/WritingTime.start()

func show():
	if text_position == 1:
		$PhotoPanel/PhotoTwo.visible = true
	elif text_position == 4:
		$PhotoPanel/PhotoThree.visible = true

func _on_Button2_button_down():
	if presses_count < text1.size() - 1:
		$PhotoPanel/MensagePanel/Label.text = ''
		text_position+=1
		current_text = ''
		current_text_pos = 0
		presses_count += 1
		show()
	else:
		emit_signal('end_retrospectiva', 'menu')
	pass # Replace with function body.
