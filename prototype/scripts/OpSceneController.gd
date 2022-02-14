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
	
	load_control_scene('res://scenes/GUI/Production.tscn','Production', 'end_production')
	used_scenes[0].instance.layer = 1
	
func end_current_scene():
	if current_scene_name == 'Production':
		# Logo Scene
		load_control_scene('res://scenes/GUI/LogoOpening.tscn','LogoOpening', 'end_logo_scene')
	elif current_scene_name == 'LogoOpening':
		# First Access 
		load_control_scene('res://scenes/FirstAccess/Access01.tscn', 'Access01', 'end_access01')
	elif current_scene_name == 'Access01':
		# Map Scene
		load_control_scene('res://scenes/GUI/Map02.tscn', 'Map02', 'None')
		
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
#func _on_Production_end_production():
#	logo_scene = load('res://scenes/GUI/LogoOpening.tscn').instance()
#	logo_scene.layer = -1
#	add_child(logo_scene)
#
#	transition_animation.play("fade_in")
#	transition_animation_name = "fade_in"

#func _on_TransitionAnimation_animation_finished(anim_name):
#	print(transition_animation_name)
#	if transition_animation_name == "fade_in":
#		transition_animation.play("fade_out")
#		logo_scene = 1
#		
#		# Remove Production Scene
#		$Production.queue_free()
#		
#		transition_animation_name = "finish_animations"
#		
#	elif transition_animation_name == "fade_out":
#		transition_animation_name = "fade_in"

