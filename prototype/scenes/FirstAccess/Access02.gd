extends CanvasLayer

signal end_access02

signal start_audio
signal next_audio

var text_tutorials = ['O Jogo Atitude Historiadora, criado na Universidade de Brasília como Histórias no Quadradim,  propõe uma dupla imersão: em histórias pouco conhecidas do Distrito Federal e na experimentação de práticas vivenciadas por historiadores e historiadoras: trabalhando com fontes, desvendando pistas, encontrando personagens e reconhecendo novas narrativas...',
'Sua missão é interagir com indícios do passado para completar as lacunas de seu diário de bordo. Ao final, essa jornada investigativa será dividida em nove episódios, desvendando alguns episódios pouco conhecidos na história desse nosso quadradim...',
'Para além do Plano Piloto de concreto, de JK e seu panteão de heróis, a nossa aventura parte dos redemoinhos de poeira, para percorrer chafarizes, quadradões, caixas d\'água e gambiarras. Nela, estão trabalhadores em rebelião, mulheres negras, periferias plurais, indígenas, estudantes e outras coletividades em luta. Afinal, desde o passado,  nem tudo está nas asas, e menos ainda nos eixos.']

var text_position = 0
var current_text_pos = 0
var current_text = ''
var presses_count = 0

func write_text():
	pass

func _ready():
	$FinishWriting.start()
	$WritingTime.start()
	$Mapa.disabled = true

func _process(delta):
	$MainMusic.update("soundtrack")

func _on_WritingTime_timeout():
	if current_text_pos < len(text_tutorials[text_position]) and self.layer != -1:
		current_text += text_tutorials[text_position][current_text_pos]
		current_text_pos += 1
		$TutorialText.text = current_text
	$WritingTime.start()


func start_writing():
	emit_signal("start_audio")
	$WritingTime.start()

func play_music():
	return $MainMusic

func music_finished():
	$MainMusic.play()


func _on_FinishWriting_timeout():
	$Mapa.disabled = false



func _on_Mapa_button_down():
	if presses_count < text_tutorials.size() - 1:
		$TutorialText.text = ''
		text_position+=1
		current_text = ''
		current_text_pos = 0
		presses_count += 1
		$Mapa.disabled = true
		$FinishWriting.start()

		emit_signal("next_audio")
	else:
		emit_signal("end_access02", "character_choice")
	pass # Replace with function body.
