extends Node

var current_scene_name = 'TravelScene'

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if current_scene_name.out_signal == "go_to_nucleo":
		print("foi")
	pass # Replace with function body.

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
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
