extends Node

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

var used_scenes = []
var current_scene_name = 'Production'

var logo_scene

class SceneUsed:
	var instance
	var out_signal

func load_control_scene(local, name, out_signal):
	# 'out_signal' : The scene must to emit a signal
	# 					  when you want out scene.
	print(local)
	var new_scene = SceneUsed.new()
	new_scene.instance = load(local).instance()
	new_scene.instance.layer = -1
	new_scene.out_signal = out_signal
	new_scene.instance.connect(out_signal, self, 'end_current_scene')
	
	used_scenes.append(new_scene)
	current_scene_name = name
	
	add_child(used_scenes[-1].instance)

func _ready():
	transition_animation.connect('animation_finished', self, 'end_transition_scene')
	transition_animation.play("fade_out")
	
	load_control_scene('res://Scenes/Opening/Production.tscn','Production', 'end_production')
	used_scenes[0].instance.layer = 1
	
func end_current_scene():
	if current_scene_name == 'Production':
		# Next Scene -> Logo Opening
		load_control_scene('res://Scenes/Opening/LogoOpening.tscn','LogoOpening', 'end_logo_scene')
	elif current_scene_name == 'LogoOpening':
		# Next Scene -> Menu	
		load_control_scene('res://Scenes/GUI/Menu.tscn', 'Menu', 'end_menu')
	elif current_scene_name == 'Menu':
		# Next Scene -> Introcution Ticket 
		load_control_scene('res://Scenes/Tutorial/IntroductionTicket.tscn', 'IntroductionTicket', 'end_access01')
	elif current_scene_name == 'IntroductionTicket':
		# Next Scene -> Instructions and informations about the game
		load_control_scene('res://Scenes/Tutorial/AboutGame.tscn', 'AboutGame', 'end_access02')
	elif current_scene_name == 'AboutGame':
		# Next Scene -> Character Creation
		load_control_scene('res://Scenes/Tutorial/CharacterCreation.tscn', 'CharacterCreation', 'end_choice')
	elif current_scene_name == 'CharacterCreation':
		# Next Scene -> Showing Diary to users
		load_control_scene('res://Scenes/GUI/Diary.tscn', 'Diary', 'end_diary')

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
			
	elif transition_animation_name == "fade_out":
		transition_animation_name = "fade_in"
