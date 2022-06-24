extends CanvasLayer

onready var transition_animation = $TransitionAnimation
onready var transition_animation_name = "fade_out"

var text_position = 0
var current_text_pos = 0
var current_text = ''
var text_tutorials =['Escolha seu transporte de acordo com o destino desejado.']

const Nucleo = preload("res://scenes/Levels/NúcleoBandeirante.tscn")
const Tagua = preload("res://scenes/Levels/Taguatinga.tscn")
const Esplanada = preload("res://scenes/Levels/Esplanada.tscn")

signal arrive
signal end_travel
signal go_to_nucleo
var travel_destiny = 'a' 

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_Timer_timeout()
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


func _on_Timer_timeout():
	if current_text_pos < len(text_tutorials[text_position]):
		current_text += text_tutorials[text_position][current_text_pos]
		current_text_pos += 1
		$HelpText.text = current_text
	pass # Replace with function body.
