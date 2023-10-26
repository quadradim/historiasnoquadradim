extends CanvasLayer

onready var logo_animation = $LogoAnimation
var backward_animation = false

signal end_logo_scene

func _ready():
	logo_animation.play("ResizeLogo")

func _on_Background_gui_input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("end_logo_scene", "menu")

func _on_LogoAnimation_animation_finished(_anim_name):
	if !backward_animation:
		logo_animation.play_backwards("ResizeLogo")
		backward_animation = true
	else:
		logo_animation.play("ResizeLogo")
		backward_animation = false
