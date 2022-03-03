extends CanvasLayer

func _ready():
	$MenuAnimation.play("BackgroundChange")

func animation_finished(anim_name):
	$MenuAnimation.play_backwards("BackgroundChange")
