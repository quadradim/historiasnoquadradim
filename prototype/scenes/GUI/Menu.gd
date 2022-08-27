extends CanvasLayer

signal end_menu

func _ready():
	$MenuControl/ConfigurationWindow.get_child(0).hide()
	$MenuAnimation.play("BackgroundChange")

func animation_finished(anim_name):
	$MenuAnimation.play_backwards("BackgroundChange")

func press_game_start():
	emit_signal("end_menu", "access01")

func config_pressed():
	$MenuControl/ConfigurationWindow.get_child(0).show()

func exit_configuration():
	$MenuControl/ConfigurationWindow.get_child(0).hide()
