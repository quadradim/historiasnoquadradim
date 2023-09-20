extends CanvasLayer
onready var veicles = get_node("/root/Global")

signal end_cronica_raulino
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var text_tutorials = ['E então paramos diante do Lago Norte, de onde avistei a cidade que escondia sua periferia pobre: as outras cidades habitadas pelos filhos e netos dos candangos, migrantes que construíram a Novacap. Quase não reconheço a Brasília da década de 1960, mas minha memória girava em cenas do passado: o colégio de aplicação, o campus da UnB, os namoros no cerrado, as peças de teatro, os primeiros poemas, os amigos presos, alguns torturadores. Os amigos mortos. \n \n Trecho da crônica do livro: “Um solitário à espreita” de Milton Hatoum.\n UM ILUSTRE REFUGIADO POLÍTICO']

# Called when the node enters the scene tree for the first time.
var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0

func write_text():
	pass

func _ready():
	$ChatBox.visible = false
	$Sprite3.visible = true
	$TutorialText.visible = true
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
		$Sprite3.visible = false
		$TutorialText.visible = false
		$ChatBox.visible = true
		$Continuar.visible = false
		

func _on_ChatBox_end_dialog():
	veicles.locked_veicles[1] = 1
	emit_signal("end_cronica_raulino","travel_scene")

