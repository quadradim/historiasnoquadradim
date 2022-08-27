extends Node

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

var used_scenes = []

var logo_scene

class SceneUsed:
	var instance
	var out_signal
	
var current_scene_name

var scenes_data = {
#	'name': [
#		'local',
#		'emited_signal'
#	]
	'logo_opening': [
		'res://scenes/GUI/LogoOpening.tscn',
		'end_logo_scene'
	],
	'menu': [
		'res://scenes/GUI/Menu.tscn',
		'end_menu'
	],
	'access01': [
		'res://scenes/FirstAccess/Access01.tscn',
		'end_access01'
	],
	'access02': [
		'res://scenes/FirstAccess/Access02.tscn',
		'end_access02'
	],
	'character_choice': [
		'res://scenes/FirstAccess/CharacterChoice.tscn',
		'end_choice'
	],
	'diary': [
		'res://scenes/GUI/Diary.tscn',
		'end_diary'
	],
	'suzana': [
		'res://scenes/dialogs/Suazana.tscn',
		'end_suzana_dialog'
	],
}

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
	if current_scene_name == 'suzana':
		used_scenes[0].instance.start()

func load_audio():
	if current_scene_name in 'access01,access02,character_choice,diary,suzana':
		var audio = used_scenes[0].instance.play_music()
		
		var player_data = $PlayerEntity.read()
		audio.set_volume_db(player_data["soundtrack"])
		audio.play()

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
	if not $PlayerEntity.player_exists():
		create_player()
		
	transition_animation.connect('animation_finished', self, 'end_transition_scene')
	transition_animation.play("fade_out")
	
	load_control_scene('res://scenes/GUI/Production.tscn', 'production', 'end_production')
	used_scenes[0].instance.layer = 1
	
func change_scene(scene):
	for current_scene in scenes_data:
		if scene == current_scene:
			load_control_scene(
				scenes_data[current_scene][0],
				scene,
				scenes_data[current_scene][1]
			)	

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
			
			load_audio()
			start_events()
			
	elif transition_animation_name == "fade_out":
		transition_animation_name = "fade_in"
