var scenes_data = {
#	'name': [
#		'local',
#		'emited_signal',
#		'has_config'
#		'audio' => null, 'path', 'continue'
#	]
	'production': [
		'res://scenes/GUI/Production.tscn',
		'end_production',
		false,
		null
	],
	'logo_opening': [
		'res://scenes/GUI/LogoOpening.tscn',
		'end_logo_scene',
		false,
		'res://soundtrack/Loop1 Intro.mp3'
	],
	'menu': [
		'res://scenes/GUI/Menu.tscn',
		'end_menu',
		false,
		'continue'
	],
	'access01': [
		'res://scenes/FirstAccess/Access01.tscn',
		'end_access01',
		true,
		'res://soundtrack/Loop2-Atualizado.mp3'
	],
	'access02': [
		'res://scenes/FirstAccess/Access02.tscn',
		'end_access02',
		true,
		'continue'
	],
	'character_choice': [
		'res://scenes/FirstAccess/CharacterChoice.tscn',
		'end_choice',
		true,
		'res://soundtrack/Loop3x.mp3'
	],
	'diary': [
		'res://scenes/GUI/Diary.tscn',
		'end_diary',
		true,
		'res://soundtrack/Loop5 - Diário.mp3'
	],
	'travel_scene': [
		'res://scenes/GUI/TravelScene.tscn',
		'end_travel_scene',
		false,
		null
	],
	'episode_intro':[
		'res://scenes/Introductions/EpisodeIntro.tscn',
		'end_episode_intro',
		true,
		null
	],
	'introd_lavadeiras': [
		'res://scenes/Introductions/Lavadeiras.tscn',
		'introd_lava',
		false,
		null
	],
	'suzana': [
		'res://scenes/dialogs/Suazana.tscn',
		'end_suzana_scene',
		true,
		'continue'
	],
	'episodes_selection': [
		'res://scenes/GUI/EpisodeSelection.tscn',
		'end_episode_selection',
		false,
		'continue'
	],
	'analyze_photos': [
		'res://scenes/observation/PhotoAnalyze.tscn',
		'end_analyze',
		false,
		null
	],
	'lavadeiras': [
		'res://scenes/ambience/Lavadeiras.tscn',
		'end_lavadeira',
		true,
		'res://soundtrack/Loop4 Lavadeiras.mp3'
	],
	'lavadeira_amiga': [
		'res://scenes/dialogs/Lavadeira.tscn',
		'end_lavadeira',
		true,
		'continue'
	],
	'intro_multidao': [
		'res://scenes/Introductions/Multidao.tscn',
		'end_multidao',
		true,
		null
	],
	'multidao': [
		'res://scenes/ambience/Multidao.tscn',
		'distractor_selected',
		true,
		"res://soundtrack/hotel diamantina.mp3"
	],
	'distractor1_darcy': [
		'res://scenes/dialogs/protesto_bandeirante/Distrator01.tscn',
		'distractor_dialog',
		true,
		'continue'
	],
	'distractor2_darcy': [
		'res://scenes/dialogs/protesto_bandeirante/Distrator02.tscn',
		'distractor_dialog',
		true,
		'continue'
	],
	'distractor3_darcy': [
		'res://scenes/dialogs/protesto_bandeirante/Distrator03.tscn',
		'distractor_dialog',
		true,
		"res://soundtrack/Levante da Boa Vontade.mp3"
	],
	'darcy_speech': [
		'res://scenes/dialogs/Darcy.tscn',
		'end_darcy_speech',
		true,
		"res://soundtrack/Loop Protesto Darcy.mp3"
	],
	'word_choice': [
		'res://scenes/Minigames/WordSelection.tscn',
		'end_word_selection',
		true,
		null
	],
}
