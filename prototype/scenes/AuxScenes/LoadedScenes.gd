var scenes_data = {
#	'name': [
#		'local',
#		'emited_signal',
#		'has_config'
#		'audio' => null, 'path', 'continue'
#		'audio_description' => []
#		'has_backpack'
#	]
	'production': [
		'res://scenes/GUI/Production.tscn',
		'end_production',
		false,
		null,
		[],
		false,
	],
	'logo_opening': [
		'res://scenes/GUI/LogoOpening.tscn',
		'end_logo_scene',
		false,
		'res://assets/audio/soundtrack/Loop1 Intro.mp3',
		[],
		false,
	],
	'menu': [
		'res://scenes/GUI/Menu.tscn',
		'end_menu',
		false,
		'continue',
		[],
		false,
	],
	'access01': [
		'res://scenes/FirstAccess/Access01.tscn',
		'end_access01',
		true,
		'res://assets/audio/soundtrack/Loop2-Atualizado.mp3',
		[],
		false,
	],
	'access02': [
		'res://scenes/FirstAccess/Access02.tscn',
		'end_access02',
		true,
		'continue',
		[
			"res://assets/audio/audio_description/01_introduction/1_trecho.wav",
			"res://assets/audio/audio_description/01_introduction/2_trecho.wav",
			"res://assets/audio/audio_description/01_introduction/3_trecho.wav",
			"res://assets/audio/audio_description/01_introduction/4_trecho.wav",
		],
		false,
	],
	'character_choice': [
		'res://scenes/FirstAccess/CharacterChoice.tscn',
		'end_choice',
		true,
		'res://assets/audio/soundtrack/Loop3x.mp3',
		[],
		false,
	],
	'diary': [
		'res://scenes/GUI/Diary.tscn',
		'end_diary',
		true,
		'res://assets/audio/soundtrack/Loop5 - Diário.mp3',
		[],
		false,
	],
	'travel_scene': [
		'res://scenes/GUI/TravelScene.tscn',
		'end_travel_scene',
		true,
		null,
		[],
		false,
	],
	'episode_intro':[
		'res://scenes/NucleoBandeirante/EpisodeIntro.tscn',
		'end_episode_intro',
		true,
		null,
		[
			"res://assets/audio/audio_description/02_locality_introduction/Cidade Livre Intro.wav",
		],
		false,
	],
	'introd_lavadeiras': [
		'res://scenes/NucleoBandeirante/introLavadeiras.tscn',
		'introd_lava',
		false,
		null,
		[],
		false,
	],
	'suzana': [
		'res://scenes/NucleoBandeirante/dialogs/Suazana.tscn',
		'end_suzana_scene',
		true,
		'continue',
		[],
		false,
	],
	'episodes_selection': [
		'res://scenes/GUI/EpisodeSelection.tscn',
		'end_episode_selection',
		false,
		'continue',
		[],
		false,
	],
	'analyze_photos': [
		'res://scenes/NucleoBandeirante/PhotoAnalyze.tscn',
		'end_analyze',
		true,
		'res://assets/audio/soundtrack/puzzle_cidadelivre_loop.mp3',
		[],
		true,
	],
	'lavadeiras': [
		'res://scenes/NucleoBandeirante/Lavadeiras.tscn',
		'end_lavadeira',
		true,
		'res://assets/audio/soundtrack/Loop4 Lavadeiras.mp3',
		[],
		true,
	],
	'lavadeira_amiga': [
		'res://scenes/NucleoBandeirante/dialogs/Lavadeira.tscn',
		'end_lavadeira',
		true,
		'continue',
		[],
		false,
	],
	'analyze_photos2': [
		'res://scenes/NucleoBandeirante/PhotoAnalyze2.tscn',
		'end_analyze2',
		true,
		'res://assets/audio/soundtrack/multidao_som.mp3',
		[],
		false,
	],
	'intro_multidao': [
		'res://scenes/NucleoBandeirante/MultidaoDarcy.tscn',
		'end_multidao',
		true,
		'res://assets/audio/soundtrack/loop-intro-darcy.mp3',
		[],
		false,
	],
	'multidao': [
		'res://scenes/NucleoBandeirante/Multidao.tscn',
		'distractor_selected',
		true,
		"res://assets/audio/soundtrack/multidao_som.mp3",
		[],
		false,
	],
	'distractor1_darcy': [
		'res://scenes/NucleoBandeirante/dialogs/Distrator01.tscn',
		'distractor_dialog',
		true,
		'continue',
		[],
		false,
	],
	'distractor2_darcy': [
		'res://scenes/NucleoBandeirante/dialogs/Distrator02.tscn',
		'distractor_dialog',
		true,
		'continue',
		[],
		false,
	],
	'distractor3_darcy': [
		'res://scenes/NucleoBandeirante/dialogs/Distrator03.tscn',
		'distractor_dialog',
		true,
		"res://assets/audio/soundtrack/Levante da Boa Vontade.mp3",
		[],
		false,
	],
	'darcy_speech': [
		'res://scenes/NucleoBandeirante/dialogs/Darcy.tscn',
		'end_darcy_speech',
		true,
		"res://assets/audio/soundtrack/Loop Protesto Darcy.mp3",
		[
			"res://assets/audio/audio_description/03_darcy_speech/fala_1.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_2.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_3.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_4.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_5.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_6.wav",
			"res://assets/audio/sound_effects/clapping_sound.mp3",
			"res://assets/audio/audio_description/03_darcy_speech/fala_7.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_8.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_9.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_10.wav",
			"res://assets/audio/audio_description/03_darcy_speech/fala_11.wav",
		],
		false,
	],
	'word_choice': [
		'res://scenes/NucleoBandeirante/WordSelection.tscn',
		'end_word_selection',
		true,
		'res://assets/audio/soundtrack/loop-puzzle-word-choice.mp3',
		[],
		true,
	],
	'taguatinga_introduction':[
		'res://scenes/Taguatinga/TaguaIntroduction.tscn',
		'end_taguatinga_introduction',
		true,
		'res://assets/audio/soundtrack/taguatinga-longo.mp3',
		["res://assets/audio/audio_description/02_locality_introduction/Taguatinga Intro.wav",],
		false,
	],
	'Taguatinga': [
		'res://scenes/Taguatinga/Taguatinga.tscn',
		'end_taguatinga',
		true,
		'continue',
		[],
		true,
	],
	'jose_dialog':[
		'res://scenes/Taguatinga/dialogs/JoséMiguel.tscn',
		'end_jose_dialog',
		true,
		'continue',
		[],
		false,
	],
	'policial_distrator_dialog':[
		'res://scenes/Taguatinga/dialogs/PolicialDistrator.tscn',
		'end_policial_distrator_dialog',
		true,
		'continue',
		[],
		false,
	],
	'chefe_de_policia_dialog':[
		'res://scenes/Taguatinga/dialogs/ChefeDePolicia.tscn',
		'end_chefe_de_policia_dialog',
		true,
		'continue',
		[],
		true,
	],
	'distrator_trabalhador_dialog':[
		'res://scenes/Taguatinga/dialogs/DistratorTrabalhador.tscn',
		'end_distrator_trabalhador_dialog',
		true,
		'res://assets/audio/soundtrack/multidao-taguatinga.mp3',
		[],
		false,
	],
	'raulino_dialog':[
		'res://scenes/Taguatinga/dialogs/Raulino.tscn',
		'end_raulino_dialog',
		true,
		'res://assets/audio/soundtrack/multidao-taguatinga.mp3',
		[],
		true,
	],
	'folheto_raulino':[
		'res://scenes/Taguatinga/RaulinoBook.tscn',
		'end_folheto_raulino',
		true,
		'continue',
		[],
		false,
	],
	'raulino2_dialog':[
		'res://scenes/Taguatinga/dialogs/Raulino2.tscn',
		'end_raulino2_dialog',
		true,
		'res://assets/audio/soundtrack/multidao-taguatinga.mp3',
		[],
		true,
	],
	'cronica_raulino':[
		'res://scenes/Taguatinga/RaulinoCronica.tscn',
		'end_cronica_raulino',
		true,
		'res://assets/audio/soundtrack/loop-analise-de-fotos2.mp3',
		[],
		false,
	],
	'plano_piloto_intro':[
		'res://scenes/PlanoPiloto/PlanoPilotointro.tscn',
		'end_plano_piloto_intro',
		true,
		'res://assets/audio/soundtrack/Levante da Boa Vontade.mp3',
		['res://assets/audio/audio_description/02_locality_introduction/Plano Piloto & Esplanada Intro.wav'],
		true,
	],
	'israel_dialog':[
		'res://scenes/PlanoPiloto/dialogs/IsraeldaSilva.tscn',
		'end_israel_dialog',
		true,
		'continue',
		[],
		true,
	],
	'ranieri_jornalista_dialog':[
		'res://scenes/PlanoPiloto/dialogs/RanieriJornalista.tscn',
		'end_ranieri_jornalista_dialog',
		true,
		'res://assets/audio/soundtrack/taguatinga-longo.mp3',
		[],
		true,
	],
	'israel_professora_dialog':[
		'res://scenes/PlanoPiloto/dialogs/IsraelProfessora.tscn',
		'end_israel_professora_dialog',
		true,
		'res://assets/audio/soundtrack/Levante da Boa Vontade.mp3',
		[],
		true,
	],
	'radio_israel_prof':[
		'res://scenes/PlanoPiloto/dialogs/RadioIsraelProf.tscn',
		'end_radio_israel_prof',
		true,
		null,
		["res://assets/audio/audio_description/04_radio_plano_piloto/radio.wav",],
		false,
	],
	'word_selection_2':[
		'res://scenes/PlanoPiloto/WordSelection2.tscn',
		'end_word_selection_2',
		true,
		'res://assets/audio/soundtrack/puzzle-palavras-plano-piloto.mp3',
		[],
		true,
	],
	'retrospectiva':[
		'res://scenes/FirstAccess/Retro234.tscn',
		'end_retrospectiva',
		true,
		'res://assets/audio/soundtrack/tema-retrospectiva.mp3',
		[],
		false,
	]
}
