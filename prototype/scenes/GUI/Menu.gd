extends CanvasLayer

func _ready():
	$MenuAnimation.play("BackgroundChange")

func animation_finished(anim_name):
	$MenuAnimation.play_backwards("BackgroundChange")

func press_game_start():
	print('oi')
