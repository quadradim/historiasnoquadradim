extends Node

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

var used_scenes = []

var logo_scene
var show_settings = false
var mouse_enabled = true

class SceneUsed:
	var instance
	var out_signal

var current_scene_name

var scenes_data
var characters_darcy = [0, 0, 0]

var next_audio_enabled = false
var next_audio_should_play = false
var audio_description_stack = []
var current_audio = 0

var previous_played_scene = []
var is_continued_audio = false

func verify_if_back_to_previous_scene(name):
	if len(previous_played_scene) != 0 and \
	previous_played_scene[0] == name and \
	scenes_data[current_scene_name][3] == 'continue':
		is_continued_audio = true

func load_control_scene(local, name, out_signal):
	# 'out_signal' : The scene must to emit a signal
	# 					  when you want out scene.
	print(local)
	var new_scene = SceneUsed.new()
	new_scene.instance = load(local).instance()
	new_scene.instance.layer = -1
	new_scene.out_signal = out_signal
	new_scene.instance.connect(out_signal, self, 'change_scene')

	new_scene.instance.connect('start_audio', self, 'start_audio_description')
	new_scene.instance.connect('next_audio', self, 'change_audio_description')

	used_scenes.append(new_scene)
	
	verify_if_back_to_previous_scene(name)
		
	current_scene_name = name
	
	current_audio = 0

	add_child(used_scenes[-1].instance)

func start_events():
	if current_scene_name == 'access02':
		used_scenes[0].instance.start_writing()
	elif current_scene_name == 'suzana':
		used_scenes[0].instance.start()
	elif current_scene_name == 'lavadeira_amiga':
		used_scenes[0].instance.start()
	elif current_scene_name == 'distractor1_darcy':
		used_scenes[0].instance.start()
	elif current_scene_name == 'distractor2_darcy':
		used_scenes[0].instance.start()
	elif current_scene_name == 'distractor3_darcy':
		used_scenes[0].instance.start()
	elif current_scene_name == 'intro_multidao':
		used_scenes[0].instance.start()
	elif current_scene_name == 'darcy_speech':
		used_scenes[0].instance.start()

func load_audio(audio):
	if audio == null:
		$Audio.stream = null
		return
	if is_continued_audio:
		is_continued_audio = false
		return
	if audio != 'continue':
		var player_data = $PlayerEntity.read()
		$Audio.stream = load(audio)
		$Audio.set_volume_db(player_data["soundtrack"])
		$Audio.play()
		is_continued_audio = false

func create_player():
	$PlayerEntity.insert(
		{
			"name": "none",
			"habilities": [],
			"backpack": "res://assets/Images/Composition/CharacterChoice/mochilas/redimensionado/mochila01.png",
			"ability": [0,0,0,0,0,0,0,0,0],
			"characters":0,
			"soundtrack": -20,
			"soundeffect": -20,
			"audio_description": -20,
#			"current_scene": "access01"
		}
	)

func _ready():
	scenes_data = preload("res://scenes/AuxScenes/LoadedScenes.gd").new()
	scenes_data = scenes_data.scenes_data

	if not $PlayerEntity.player_exists():
		create_player()
		$Backpack.load_backpack_structure()

	$ConfigurationPopup.layer = -1
	$Backpack.layer = -1

	transition_animation.connect('animation_finished', self, 'end_transition_scene')
	transition_animation.connect('animation_started', self, 'transition_animation_started')

	transition_animation.play("fade_out")

	var initial_scene = "production" #production
	load_control_scene(
		scenes_data[initial_scene][0],
		initial_scene,
		scenes_data[initial_scene][1]
	)

	used_scenes[0].instance.layer = 1

func _process(delta):
	$Audio.update('soundtrack')
	$AudioDescription.update('audio_description')
	
	# Temporary Solution
	$Backpack._ready()

func object_layer(state_element, object_scene_element_layer):
	var element_visible = false
	if state_element:
		object_scene_element_layer.layer = 2
		element_visible = true
	else:
		object_scene_element_layer.layer = -1
		element_visible = false
	return element_visible

func change_scene(scene):
	$AudioDescription.stop()

	if not mouse_enabled:
		return
	
	# Quit
	if scene == "quit":
		get_tree().quit()

	# Back to previous scenes
#	if current_scene_name == "menu" \
#	and $PlayerEntity.read()["current_scene"] != "menu":
#		scene = $PlayerEntity.read()["current_scene"]
#
#	if not(scene in "production,logo_opening,menu,episodes_selection"):
#		$PlayerEntity.modifier("travel_scene", scene)
	#=============================

	previous_played_scene.append(current_scene_name)
	if len(previous_played_scene) > 2:
		previous_played_scene.pop_front()

	if scene == 'distractor3_darcy' and not(characters_darcy[0] and characters_darcy[1]):
		return
	if scene == 'distractor1_darcy':
		characters_darcy[0] = 1
	if scene == 'distractor2_darcy':
		characters_darcy[1] = 1

	for current_scene in scenes_data:
		if scene == current_scene:
			show_settings = object_layer(scenes_data[current_scene][2], $ConfigurationPopup)
			object_layer(scenes_data[current_scene][5], $Backpack)

			load_control_scene(
				scenes_data[current_scene][0],
				scene,
				scenes_data[current_scene][1]
			)
			break

	transition_animation.play("fade_in")
	transition_animation_name = "fade_in"

func end_transition_scene(anim_name):
	if anim_name == "fade_out":
		$ConfigurationPopup.show()
		$Backpack.show()
		mouse_enabled = true
		
	if transition_animation_name == "fade_in":
		transition_animation.play("fade_out")

		used_scenes[0].instance.queue_free()
		used_scenes.pop_front()
		transition_animation_name = "finish_animations"

		if used_scenes.size() > 0:
			used_scenes[0].instance.layer = 1

			start_events()
			load_audio(scenes_data[current_scene_name][3])

	elif transition_animation_name == "fade_out":
		transition_animation_name = "fade_in"

func transition_animation_started(anim_name):
	if anim_name == "fade_in":
		$ConfigurationPopup.hide()
		$Backpack.hide()
		mouse_enabled = false

func setting_back_menu():
	change_scene('menu')

func play_audio_description():
	var player_data = $PlayerEntity.read()
	$AudioDescription.stream = load(scenes_data[current_scene_name][4][current_audio])
	$AudioDescription.set_volume_db(player_data["audio_description"])
	$AudioDescription.play()
	current_audio += 1

func start_audio_description():
	play_audio_description()

func change_audio_description():
	play_audio_description()
