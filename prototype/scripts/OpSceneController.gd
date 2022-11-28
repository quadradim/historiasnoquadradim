extends Node

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

var used_scenes = []

var logo_scene
var show_settings = false

class SceneUsed:
	var instance
	var out_signal
	
var current_scene_name

var scenes_data
var characters_darcy = [0, 0, 0]

func load_control_scene(local, name, out_signal):
	# 'out_signal' : The scene must to emit a signal
	# 					  when you want out scene.
	var new_scene = SceneUsed.new()
	new_scene.instance = load(local).instance()
	new_scene.instance.layer = -1
	new_scene.out_signal = out_signal
	new_scene.instance.connect(out_signal, self, 'change_scene')
	
	used_scenes.append(new_scene)
	current_scene_name = name
	
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

#func load_audio():
#	if current_scene_name in """
#		access01,access02,character_choice,diary,suzana,lavadeiras,
#		lavadeira_amiga,menu,multidao,darcy_speech
#		""":
#		var audio = used_scenes[0].instance.play_music()
#
#		var player_data = $PlayerEntity.read()
#		audio.set_volume_db(player_data["soundtrack"])
#		audio.play()

func create_player():
	$PlayerEntity.insert(
		{
			"name": "none",
			"habilities": [],
			"backpack": [],
			"historiometer": 0,
			"soundtrack": -20,
			"soundeffect": -20
		}
	)
	
func _ready():
	scenes_data = preload("res://scenes/AuxScenes/LoadedScenes.gd").new()
	scenes_data = scenes_data.scenes_data
	
	if not $PlayerEntity.player_exists():
		create_player()
		
	$ConfigurationPopup.layer = -1
	
	transition_animation.connect('animation_finished', self, 'end_transition_scene')
	transition_animation.play("fade_out")

	var initial_scene = 'production'
	load_control_scene(
		scenes_data[initial_scene][0],
		initial_scene,
		scenes_data[initial_scene][1]
	)

	used_scenes[0].instance.layer = 1

func change_scene(scene):
	if scene == 'distractor3_darcy' and not(characters_darcy[0] and characters_darcy[1]):
		return
	if scene == 'distractor1_darcy':
		characters_darcy[0] = 1
	if scene == 'distractor2_darcy': 
		characters_darcy[1] = 1
		 
	for current_scene in scenes_data:
		if scene == current_scene:
			if scenes_data[current_scene][2]:
				$ConfigurationPopup.layer = 2
				show_settings = true
			else:
				$ConfigurationPopup.layer = -1
				show_settings = false
				
			load_control_scene(
				scenes_data[current_scene][0],
				scene,
				scenes_data[current_scene][1]
			)
			break

	if scene == "quit":
		get_tree().quit()

	transition_animation.play("fade_in")
	transition_animation_name = "fade_in"

func end_transition_scene(anim_name):
	if transition_animation_name == "fade_in":
		transition_animation.play("fade_out")
		
		used_scenes[0].instance.queue_free()
		used_scenes.pop_front()
		transition_animation_name = "finish_animations"
		
		if used_scenes.size() > 0:
			used_scenes[0].instance.layer = 1
			
			start_events()
#			load_audio()
			
	elif transition_animation_name == "fade_out":
		transition_animation_name = "fade_in"

func setting_back_menu():
	change_scene('menu')
