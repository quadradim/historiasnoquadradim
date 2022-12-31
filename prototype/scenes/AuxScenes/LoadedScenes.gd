var scenes_data = {
#	'name': [
#		'local',
#		'emited_signal',
#		'has_config'
#		'audio' => null, 'path', 'continue',
#		'active_backpack' => True/False
#	]
	'production': [
		'res://scenes/GUI/Production.tscn',
		'end_production',
		false,
		null,
		false
	],
	'logo_opening': [
		'res://scenes/GUI/LogoOpening.tscn',
		'end_logo_scene',
		false,
		null,
		false
	],
	'menu': [
		'res://scenes/GUI/Menu.tscn',
		'end_menu',
		false,
		'res://soundtrack/Loop1 Intro.mp3',
		false
	],
	'access01': [
		'res://scenes/FirstAccess/Access01.tscn',
		'end_access01',
		true,
		'continue',
		false
	],
	'access02': [
		'res://scenes/FirstAccess/Access02.tscn',
		'end_access02',
		true,
		null,
		false
	],
	'character_choice': [
		'res://scenes/FirstAccess/CharacterChoice.tscn',
		'end_choice',
		true,
		null,
		false
	],
	'diary': [
		'res://scenes/GUI/Diary.tscn',
		'end_diary',
		true,
		null,
		false
	],
	'suzana': [
		'res://scenes/dialogs/Suazana.tscn',
		'end_suzana_scene',
		true,
		null,
		false
	],
	'episodes_selection': [
		'res://scenes/GUI/EpisodeSelection.tscn',
		'end_episode_selection',
		false,
		null,
		false
	],
	'analyze_photos': [
		'res://scenes/observation/PhotoAnalyze.tscn',
		'end_analyze',
		false,
		null,
		false
	],
	'lavadeiras': [
		'res://scenes/ambience/Lavadeiras.tscn',
		'end_lavadeira',
		true,
		null,
		true
	],
	'lavadeira_amiga': [
		'res://scenes/dialogs/Lavadeira.tscn',
		'end_lavadeira',
		true,
		null,
		false
	],
	'travel_scene': [
		'res://scenes/GUI/TravelScene.tscn',
		'end_travel_scene',
		false,
		null,
		false
	],
	'introd_lavadeiras': [
		'res://scenes/Introductions/Lavadeiras.tscn',
		'introd_lava',
		false,
		null,
		false
	],
	'intro_multidao': [
		'res://scenes/Introductions/Multidao.tscn',
		'end_multidao',
		true,
		null,
		false
	],
	'multidao': [
		'res://scenes/ambience/Multidao.tscn',
		'distractor_selected',
		true,
		null,
		false
	],
	'distractor1_darcy': [
		'res://scenes/dialogs/protesto_bandeirante/Distrator01.tscn',
		'distractor_dialog',
		true,
		null,
		false
	],
	'distractor2_darcy': [
		'res://scenes/dialogs/protesto_bandeirante/Distrator02.tscn',
		'distractor_dialog',
		true,
		null,
		false
	],
	'distractor3_darcy': [
		'res://scenes/dialogs/protesto_bandeirante/Distrator03.tscn',
		'distractor_dialog',
		true,
		null,
		false
	],
	'darcy_speech': [
		'res://scenes/dialogs/Darcy.tscn',
		'end_darcy_speech',
		true,
		null,
		false
	],
	'word_choice': [
		'res://scenes/Minigames/WordSelection.tscn',
		'end_word_selection',
		true,
		null,
		false
	],
}
