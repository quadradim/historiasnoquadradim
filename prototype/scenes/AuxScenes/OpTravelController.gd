extends Node

signal transitioned_to_nucleo
signal transitioned_to_tagua
signal transitioned_to_esplanada
var city = 0
	
func transition_to_nucleo():
	$TransitionAnimation.play("fade_in")
	city = 1

func transition_to_tagua():
	$TransitionAnimation.play("fade_in")
	city = 3
func transition_to_esplanada():
	$TransitionAnimation.play("fade_in")
	city = 2
func _on_TransitionAnimation_animation_finished(anim_name):
	if anim_name == "fade_in":
		$TransitionAnimation.play("fade_out")
		if city == 1:
			emit_signal("transitioned_to_nucleo")
		elif city == 2:
			emit_signal("transitioned_to_tagua")
		elif city == 3:
			emit_signal("transitioned_to_esplanada")
	if anim_name == "fade_out":
		print("transition ended")
