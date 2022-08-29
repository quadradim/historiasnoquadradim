extends CanvasLayer

var window_opened = false

signal back_menu

func _ready():
	window_opened = false
	$ConfigurationWindow.get_child(0).hide()

func popup_config_window():
	if not window_opened:
		$ConfigurationWindow.get_child(0).show()
		window_opened = true
	else:
		$ConfigurationWindow.get_child(0).hide()
		window_opened = false

func hide_window():
	$ConfigurationWindow.get_child(0).hide()
	window_opened = false

func back_menu():
	$ConfigurationWindow.get_child(0).hide()
	emit_signal("back_menu")
