extends Node

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

var logo_scene

func _ready():
	transition_animation.play("fade_out")
	
func _on_Production_end_production():
	logo_scene = load('res://scenes/GUI/LogoOpening.tscn').instance()
	logo_scene.layer = -1
	add_child(logo_scene)

	transition_animation.play("fade_in")
	transition_animation_name = "fade_in"

func _on_TransitionAnimation_animation_finished(anim_name):
	print(transition_animation_name)
	if transition_animation_name == "fade_in":
		transition_animation.play("fade_out")
		logo_scene = 1
		
		# Remove Production Scene
		$Production.queue_free()
		
		transition_animation_name = "finish_animations"
		
	elif transition_animation_name == "fade_out":
		transition_animation_name = "fade_in"
