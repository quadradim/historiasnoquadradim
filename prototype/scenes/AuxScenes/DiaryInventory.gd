extends Tabs

var player_data
signal end_diary
var animation_finish = true

#function for sum array for historiometer
func sum_array(array):
	var sum = 0
	for element in array:
		 sum += element
	return sum

func load_diary_statements():
	player_data = $Player.read()
	
	# Load backpack
	$ProfileTab/BackpackPanel/Backpack.texture = load(player_data["backpack"])
	
	# Load Habilities
#	$ProfileTab/ItemPanel01/hability.texture = load(player_data["habilities"][0][0])
#	$ProfileTab/ItemPanel02/hability.texture = load(player_data["habilities"][1][0])
#	$ProfileTab/ItemPanel03/hability.texture = load(player_data["habilities"][2][0])
	
	# Load Name
	$ProfileTab/HistorianName.text = player_data["name"]
	
	#Load Characters
	if player_data["characters"] > 0:
		$CharactersTab/Character1.visible = true
	if player_data["characters"] > 1:
		$CharactersTab/Character2.visible = true
	if player_data["characters"] > 2:
		$CharactersTab/Character3.visible = true
	if player_data["characters"] > 3:
		$CharactersTab/Character4.visible = true
	if player_data["characters"] > 4:
		$CharactersTab/Character5.visible = true
	if player_data["characters"] > 5:
		$CharactersTab/Character6.visible = true
	if player_data["characters"] > 6:
		$CharactersTab/Character7.visible = true
	if player_data["characters"] > 7:
		$CharactersTab/Character8.visible = true
	if player_data["characters"] > 8:
		$CharactersTab/Character9.visible = true
	#Load Abilitys
	$AbillityTab/Binoculos.visible = player_data["ability"][0]
	$AbillityTab/Cartazes.visible = player_data["ability"][1]
	$AbillityTab/Chapeu.visible = player_data["ability"][2]
	$AbillityTab/Cubo.visible = player_data["ability"][3]
	$AbillityTab/JogoDaMemoria.visible = player_data["ability"][4]
	$AbillityTab/Jornal.visible = player_data["ability"][5]
	$AbillityTab/Livros.visible = player_data["ability"][6]
	$AbillityTab/Pasta.visible = player_data["ability"][7]
	$AbillityTab/Planeta.visible = player_data["ability"][8]
	
	#Load Historiometer
	var historiometer = sum_array(player_data["ability"])
	if historiometer > 0:
		$AbillityTab/HistoriometroTab/Historiomentro1.visible = true
	if historiometer > 1:
		$AbillityTab/HistoriometroTab/Historiomentro2.visible = true
	if historiometer > 2:
		$AbillityTab/HistoriometroTab/Historiomentro3.visible = true
	if historiometer > 3:
		$AbillityTab/HistoriometroTab/Historiomentro4.visible = true
	if historiometer > 4:
		$AbillityTab/HistoriometroTab/Historiomentro5.visible = true
	if historiometer > 5:
		$AbillityTab/HistoriometroTab/Historiomentro6.visible = true
	if historiometer > 6:
		$AbillityTab/HistoriometroTab/Historiomentro7.visible = true
	if historiometer > 7:
		$AbillityTab/HistoriometroTab/Historiomentro8.visible = true
	if historiometer > 8:
		$AbillityTab/HistoriometroTab/Historiomentro9.visible = true		

func _ready():
	pass
	
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
	$MapTab/Map.modulate = Color(1,1,1,1)
	$MapTab/City1/Highlight_NucleoBandeirante.visible = false
	$MapTab/City2/Highlight_Taguatinga.visible = false
	$MapTab/City3/Highlight_PlanoPiloto.visible = false
	$MapTab/CityDescription.text = (
	"""texto falando umpouco sobre a cidade e seu contexto 
	   social histórico.""")


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
	$MapTab/City1/Highlight_NucleoBandeirante.visible = true
	$MapTab/City2/Highlight_Taguatinga.visible = false
	$MapTab/City3/Highlight_PlanoPiloto.visible = false
	if $MapTab/Map.modulate == Color(1,1,1,1):
		$MapTab/Fadeout_map.play("Fadeout_map")


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
	$MapTab/City1/Highlight_NucleoBandeirante.visible = false
	$MapTab/City2/Highlight_Taguatinga.visible = true
	$MapTab/City3/Highlight_PlanoPiloto.visible = false
	if $MapTab/Map.modulate == Color(1,1,1,1):
		$MapTab/Fadeout_map.play("Fadeout_map")


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
	$MapTab/City1/Highlight_NucleoBandeirante.visible = false
	$MapTab/City2/Highlight_Taguatinga.visible = false
	$MapTab/City3/Highlight_PlanoPiloto.visible = true
	if $MapTab/Map.modulate == Color(1,1,1,1):
		$MapTab/Fadeout_map.play("Fadeout_map")



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
	$AbillityTab/AbillityName.text = ("Olhar aguçado")
	$AbillityTab/DescriptionText.text = ("Análise atenta aos detalhes aparentemente insignificantes")
	pass # Replace with function body.

func _on_CartazesButton_pressed():
	$AbillityTab/AbillityName.text = ("Problematização")
	$AbillityTab/DescriptionText.text = ("Método de ir além de pensamentos do senso comum")
	pass # Replace with function body.

func _on_ChapuButton_pressed():
	$AbillityTab/AbillityName.text = ("Capacidade Investigativa")
	$AbillityTab/DescriptionText.text = ("Formulação de perguntas e busca pelas respostas de maneira autônoma e independente")
	pass # Replace with function body.

func _on_CuboButton_pressed():
	$AbillityTab/AbillityName.text = ("Raciocínio Lógico")
	$AbillityTab/DescriptionText.text = ("Organização do pensamento para a resolução de um problema")
	pass # Replace with function body.

func _on_jogoDaMemriaButton_pressed():
	$AbillityTab/AbillityName.text = ("Memorização")
	$AbillityTab/DescriptionText.text = ("Processo mental para reunir informações de forma sistemática")
	pass # Replace with function body.

func _on_JornalButton_pressed():
	$AbillityTab/AbillityName.text = ("Criticidade")
	$AbillityTab/DescriptionText.text = ("Forma dese posicionar, criticarevidências e elaborarinferências")
	pass # Replace with function body.

func _on_LivrosButton_pressed():
	$AbillityTab/AbillityName.text = ("Curiosidade")
	$AbillityTab/DescriptionText.text = ("Interesse porconhecer coisas novas")
	pass # Replace with function body.

func _on_PastaButton_pressed():
	$AbillityTab/AbillityName.text = ("Seletividade")
	$AbillityTab/DescriptionText.text = ("Capacidade deidentificar fontes que permitamreconhecer vestígios da história")
	pass # Replace with function body.

func _on_PlanetaButton_pressed():
	$AbillityTab/DescriptionText.text = ("Atenção aoque é dito e capacidade decompreensão do que nãoparece óbvio")
	$AbillityTab/AbillityName.text = ("Escuta Sensível")
	pass

func _on_Character1Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character1.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("Dona Suzana")
	pass # Replace with function body.
	
func _on_Character2Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character2.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("Darcy")
	pass # Replace with function body.
	
func _on_Character3Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character3.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("José Miguel")
	pass # Replace with function body.

func _on_Character4Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character4.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("Raulino")
	pass # Replace with function body.
	
func _on_Character5Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character5.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("Israel Silva")
	pass # Replace with function body.
	
func _on_Character6Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character6.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("Professora Domingas")
	pass # Replace with function body.
	
func _on_Character7Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character7.texture
	$CharactersTab/CharacterZoom.scale = Vector2(1,1)
	$CharactersTab/DescriptionText.text = ("Ranieri")
	pass # Replace with function body.
