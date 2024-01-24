extends CanvasLayer

var player_data
signal end_diary
var animation_finish = true


func _ready():	
	player_data = $PlayerEntitiy.read()
	
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
		$CharactersTab/Suzana.visible = true
	if player_data["characters"] > 1:
		$CharactersTab/Darcy.visible = true
	if player_data["characters"] > 2:
		$CharactersTab/JoseMiguel.visible = true
	if player_data["characters"] > 3:
		$CharactersTab/ChefDePolicia.visible = true
	if player_data["characters"] > 4:
		$CharactersTab/Raulino.visible = true
	if player_data["characters"] > 5:
		$CharactersTab/Israel.visible = true
	if player_data["characters"] > 6:
		$CharactersTab/ProfessoraDomingas.visible = true
	if player_data["characters"] > 7:
		$CharactersTab/Ranieri.visible = true
	if player_data["characters"] > 8:
		$CharactersTab/Sindicalista.visible = true
	#Load Abilitys
	$AbillityTab/Binoculos.visible = player_data["ability"][0]
	$AbillityTab/Livros.visible = player_data["ability"][1]
	$AbillityTab/Jornal.visible = player_data["ability"][2]
	$AbillityTab/Cubo.visible = player_data["ability"][3]
	$AbillityTab/Planeta.visible = player_data["ability"][4]
	$AbillityTab/Chapeu.visible = player_data["ability"][5]
	$AbillityTab/Pasta.visible = player_data["ability"][6]
	$AbillityTab/Cartazes.visible = player_data["ability"][7]
	$AbillityTab/JogoDaMemoria.visible = player_data["ability"][8]
	
	#Load Historiometer
	if player_data["historiometer"] > 0:
		$AbillityTab/HistoriometroTab/Historiomentro1.visible = true
	if player_data["historiometer"] > 1:
		$AbillityTab/HistoriometroTab/Historiomentro2.visible = true
	if player_data["historiometer"] > 2:
		$AbillityTab/HistoriometroTab/Historiomentro3.visible = true
	if player_data["historiometer"] > 3:
		$AbillityTab/HistoriometroTab/Historiomentro4.visible = true
	if player_data["historiometer"] > 4:
		$AbillityTab/HistoriometroTab/Historiomentro5.visible = true
	if player_data["historiometer"] > 5:
		$AbillityTab/HistoriometroTab/Historiomentro6.visible = true
	if player_data["historiometer"] > 6:
		$AbillityTab/HistoriometroTab/Historiomentro7.visible = true
	if player_data["historiometer"] > 7:
		$AbillityTab/HistoriometroTab/Historiomentro8.visible = true
	if player_data["historiometer"] > 8:
		$AbillityTab/HistoriometroTab/Historiomentro9.visible = true		

	# New Message Popup
	$FirstAccessMessage.popup()
	$FirstAccessMessageAnimation.play("NewGame")
	


func _process(delta):
	$MainMusic.update("soundtrack")

func _on_NextButton_button_down():
	emit_signal("end_diary", "travel_scene")
	pass # Replace with function body.

func play_music():
	return $MainMusic

func music_finished():
	$MainMusic.play()

#Tabs 
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

  #City Tab
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
	$AbilityIcon.scale = Vector2(0.221,0.221)
	$IconsAnimation.stop()
	pass # Replace with function body.

#Ability Tab 
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

#Characters Tab
func _on_SuzanaButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Suzana.texture
	$CharactersTab/CharacterZoom.position = Vector2(697,211)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Dona Suzana")
	pass # Replace with function body.

func _on_DarcyButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Darcy.texture
	$CharactersTab/CharacterZoom.position = Vector2(715,236)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Darcy")
	pass # Replace with function body.


func _on_JoseMiguelButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/JoseMiguel.texture
	$CharactersTab/CharacterZoom.position = Vector2(698,217)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Jose Miguel")
	pass # Replace with function body.


func _on_ChefDePoliciaButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/ChefDePolicia.texture
	$CharactersTab/CharacterZoom.position = Vector2(697,211)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Chefe de Policia")
	pass # Replace with function body.


func _on_RaulinoButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Raulino.texture
	$CharactersTab/CharacterZoom.position = Vector2(703,210)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Raulino")
	pass # Replace with function body.


func _on_IsraelButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Israel.texture
	$CharactersTab/CharacterZoom.position = Vector2(707,212)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Israel")
	pass # Replace with function body.


func _on_ProfessoraDomingasButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/ProfessoraDomingas.texture
	$CharactersTab/CharacterZoom.position = Vector2(704,210)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Professora Domingas")
	pass # Replace with function body.


func _on_RanieriButton_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Ranieri.texture
	$CharactersTab/CharacterZoom.position = Vector2(707,213)
	$CharactersTab/CharacterZoom.scale = Vector2(0.95,0.95)
	$CharactersTab/DescriptionText.text = ("Ranieri")
	pass # Replace with function body.


func _on_SindicalistaButton_pressed():
	pass # Replace with function body.
