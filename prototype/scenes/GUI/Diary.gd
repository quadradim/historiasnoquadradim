extends CanvasLayer

var player_data
signal end_diary
var locked_characters = [1,0,0,0,0,0,0,0,0]
var animation_finish = true


func _ready():
	if bool(locked_characters[0]) == false:
		$CharactersTab/Character1.texture = null
	if bool(locked_characters[1]) == false:
		$CharactersTab/Character2.texture = null
	if bool(locked_characters[2]) == false:
		$CharactersTab/Character3.texture = null
	if bool(locked_characters[3]) == false:
		$CharactersTab/Character4.texture = null
	if bool(locked_characters[4]) == false:
		$CharactersTab/Character5.texture = null
	if bool(locked_characters[5]) == false:
		$CharactersTab/Character6.texture = null
	if bool(locked_characters[6]) == false:
		$CharactersTab/Character7.texture = null
	if bool(locked_characters[7]) == false:
		$CharactersTab/Character8.texture = null
	if bool(locked_characters[8]) == false:
		$CharactersTab/Character9.texture = null
	
	player_data = $PlayerEntitiy.read()
	
	# Load backpack
	$ProfileTab/BackpackPanel/Backpack.texture = load(player_data["backpack"])
	
	# Load Habilities
	$ProfileTab/ItemPanel01/hability.texture = load(player_data["habilities"][0][0])
	$ProfileTab/ItemPanel02/hability.texture = load(player_data["habilities"][1][0])
	$ProfileTab/ItemPanel03/hability.texture = load(player_data["habilities"][2][0])
	
	# Load Name
	$ProfileTab/HistorianName.text = player_data["name"]
	
	# New Message Popup
	$FirstAccessMessage.popup()
	$FirstAccessMessageAnimation.play("NewGame")
	


func _process(delta):
	$MainMusic.update("soundtrack")

func _on_Button_pressed():
	emit_signal("end_diary", "travel_scene")

func play_music():
	return $MainMusic

func music_finished():
	$MainMusic.play()


func _on_PlayerButton_pressed():
	$ProfileTab.visible = true
	$MapTab.visible = false
	$CharactersTab.visible = false
	$AbillityTab.visible = false
	pass # Replace with function body.


func _on_MapButton_pressed():
	$ProfileTab.visible = false
	$MapTab.visible = true
	$CharactersTab.visible = false
	$AbillityTab.visible = false
	pass # Replace with function body.


func _on_CharactersButton_pressed():
	$ProfileTab.visible = false
	$MapTab.visible = false
	$CharactersTab.visible = true
	$AbillityTab.visible = false
	pass # Replace with function body.
	
func _on_AbillityButton_pressed():
	$ProfileTab.visible = false
	$MapTab.visible = false
	$CharactersTab.visible = false
	$AbillityTab.visible = true	
	pass # Replace with function body.


func _on_Character1Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character1.texture
	$CharactersTab/CharacterZoom.scale = Vector2(0.316,0.316)
	$CharactersTab/DescriptionText.text = ("Dona Suzana")
	pass # Replace with function body.


func _on_City1Button_pressed():
	$MapTab/CityDescription.text = (
	"""Núcleo Bandeirante: Localidade provisória, conhecida
	como Cidade Livre, este era o lugar em que o comércio
	e a vida social aconteciam durante a construção da nova
	capital. Nascendo com data marcada para deixar de existir 
	(abril de 1960), os moradores se organizavam naquele 
	momento para exigir a fixação daquele núcleo pioneiro. 
	Nos arredores da SubPrefeitura, trabalhadores começaram
	 a se identificar como "a turma da boa vontade".""")


func _on_City2Button_pressed():
	$MapTab/CityDescription.text = (
	"""Taguatinga: Surgida pela resistência de pessoas migrantes 
	que foram impedidas de adentrar a Cidade Livre, esta local-
	idade foi reconhecida em junho de 1958, a partir de uma estra-
	tégia de mobilização dos moradores. Inicialmente chamada de
	Vila Sarah Kubitschek, era a localidade que reunia o maior
	contingente populacional naquele momento, sendo o palco prin-
	cipal do levante popular ocorrido em março de 1964. 
	""")


func _on_City3Button_pressed():
	$MapTab/CityDescription.text = (
	"""Plano Piloto/ Esplanada:  Prevista no Plano Urbanístico de
	Lúcio Costa como uma via central que reúne os poderes políticos
	da capital, a Esplanada dos Ministérios liga a Praça dos Três Po-
	deres à Rodoviária do Plano Piloto. Desde o início de sua existên-
	cia, esta localidade é palco de manifestações populares, recebe-
	ndo multidões que vêm de todos os lugares do país reivindicando
	direitos.""" 
	)



func _on_FirstAccessMessageAnimation_animation_finished2(anim_name):
	$IconsAnimation.play("ProfileAnimation")
	pass # Replace with function body.


func _on_IconsAnimation_animation_finished(anim_name):
	if not animation_finish:
		$IconsAnimation.play("ProfileAnimation")
	else:
		$IconsAnimation.play_backwards("ProfileAnimation")
	animation_finish = not animation_finish
	pass # Replace with function body.


func _on_FirstAccessMessage_popup_hide():
	$ProfileIcon.scale = Vector2(0.252,0.276)
	$MapIcon.scale = Vector2(0.237,0.237)
	$CharactersIcon.scale = Vector2(0.233,0.233)
	$IconsAnimation.stop()
	pass # Replace with function body.


func _on_BinoculosButton_pressed():
	$AbillityTab/AbillityName.text = ("olhar aguçado")
	$AbillityTab/DescriptionText.text = ("Análise atenta aos detalhes aparentemente insignificantes")
	pass # Replace with function body.


func _on_CartazesButton_pressed():
	$AbillityTab/AbillityName.text = ("problematização")
	$AbillityTab/DescriptionText.text = ("Método de ir além de pensamentos do senso comum")
	pass # Replace with function body.

func _on_ChapuButton_pressed():
	$AbillityTab/AbillityName.text = ("capacidade investigativa")
	$AbillityTab/DescriptionText.text = ("Formulação de perguntas e busca pelas respostas de maneira autônoma e independente")
	pass # Replace with function body.

func _on_CuboButton_pressed():
	$AbillityTab/AbillityName.text = ("raciocínio lógico")
	$AbillityTab/DescriptionText.text = ("Organização do pensamento para a resolução de um problema")
	pass # Replace with function body.

func _on_jogoDaMemriaButton_pressed():
	$AbillityTab/AbillityName.text = ("memorização")
	$AbillityTab/DescriptionText.text = ("Processo mental para reunir informações de forma sistemática")
	pass # Replace with function body.

func _on_JornalButton_pressed():
	$AbillityTab/AbillityName.text = ("curiosidade")
	$AbillityTab/DescriptionText.text = ("Interesse por conhecer coisas novas")
	pass # Replace with function body.

func _on_LivrosButton_pressed():
	$AbillityTab/AbillityName.text = ("seletividade")
	$AbillityTab/DescriptionText.text = ("Capacidade de identificar fontes que permitam reconhecer vestígios da história")
	pass # Replace with function body.

func _on_PastaButton_pressed():
	$AbillityTab/AbillityName.text = ("escuta sensível")
	$AbillityTab/DescriptionText.text = ("Atenção ao que é dito e capacidade de compreensão do que não parece óbvio")
	pass # Replace with function body.

func _on_PlanetaButton_pressed():
	$AbillityTab/DescriptionText.text = ("Forma de se posicionar, criticar evidências e elaborar inferências")
	$AbillityTab/AbillityName.text = ("criticidade")
	pass
