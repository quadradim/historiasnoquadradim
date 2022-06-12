extends CanvasLayer

enum DiaryTabs{HISTORIADOR, MAPA, PERSONAGENS, MISSOES}

var tabs_vector = []

signal end_diary

func _ready():
	# Add Tabs
	tabs_vector.append($HistorianTab)
	tabs_vector.append($MapTab)
	tabs_vector.append($CharactersTab)
	
	print(tabs_vector)
	# Settings
	$HistorianTab/PlayerName.text = $HistorianTab/Player.get_name()
	
	hide_tabs()

func _process(delta):
	hide_tabs()
	
	#if $TabsContent/TabContainer.current_tab < tabs_vector.size():
	#	tabs_vector[$TabsContent/TabContainer.current_tab].show()

func update_character_info(image, name, description):
	var CharInfo = $CharactersTab/CharacterInfo
	CharInfo.set_image(image)
	CharInfo.set_name(name)
	CharInfo.set_description(description)
	
func hide_tabs():
	for tab in tabs_vector:
		tab.hide()
		
func clicked_character(char_src, char_name, char_info):
	update_character_info(char_src, char_name, char_info)
	
func exit_diary():
	emit_signal('end_diary')
