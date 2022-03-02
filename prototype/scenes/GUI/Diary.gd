extends CanvasLayer

enum DiaryTabs{HISTORIADOR, MAPA, PERSONAGENS, MISSOES}

var tabs_vector = []

func _ready():
	# Add Tabs
	tabs_vector.append($HistorianTab)
	tabs_vector.append($MapTab)
	tabs_vector.append($CharactersTab)
	
	print(tabs_vector)
	# Settings
	$HistorianTab/PlayerName.text = $HistorianTab/Player.get_name()
	
	hide_tabs()

func hide_tabs():
	for tab in tabs_vector:
		tab.hide()

func _process(delta):
	hide_tabs()
	
	if $TabsContent/TabContainer.current_tab < tabs_vector.size():
		tabs_vector[$TabsContent/TabContainer.current_tab].show()
