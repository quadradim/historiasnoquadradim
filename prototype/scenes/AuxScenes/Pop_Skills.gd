extends CanvasLayer
var finish = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Pop_animation.play("Pop_skill")
	$Loop_timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Loop_timer_timeout():
	if finish == 1:
		$Loop_timer.start()
		$Pop_animation2.play("Pop_skill2")
	else:
		$Loop_timer.start()
		$Pop_animation.play("Pop_skill")
	pass # Replace with function body.


func _on_Pop_animation_animation_started(anim_name):
	finish = 1
	pass # Replace with function body.


func _on_Pop_animation2_animation_started(anim_name):
	finish = 0
	pass # Replace with function body.
