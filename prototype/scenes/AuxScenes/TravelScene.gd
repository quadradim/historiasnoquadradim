extends CanvasLayer

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

const Nucleo = preload("res://scenes/Levels/NúcleoBandeirante.tscn")
const Tagua = preload("res://scenes/Levels/Taguatinga.tscn")
const Esplanada = preload("res://scenes/Levels/Esplanada.tscn")

signal arrive
signal end_travel
signal go_to_nucleo
var travel_destiny = 'a' 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_GoToNcleo_button_down():
	print("dale")
	$Node.transition_to_nucleo()

	pass 

func _on_GoToTagua_button_down():
	$Node.transition_to_tagua()
	print("dele")
	pass # Replace with function body.

func _on_GoToEsplanada_button_down():
	$Node.transition_to_esplanada()
	print("dolly")
	pass # Replace with function body.

func _on_Button_gui_input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		print('Exit Travel Scene')
		emit_signal("end_travel")


func _on_Node_transitioned_to_nucleo():
	$CourrentScene.add_child(Nucleo.instance())

func _on_Node_transitioned_to_esplanada():
	$CourrentScene.add_child(Esplanada.instance())

func _on_Node_transitioned_to_tagua():
	$CourrentScene.add_child(Tagua.instance())
