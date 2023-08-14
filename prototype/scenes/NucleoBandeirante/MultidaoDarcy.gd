extends CanvasLayer

signal end_multidao
var dialog_number = 0

func _ready():
	$ChatBox.hide_profile()
	$Image02.hide()
	$ChatBox/ChatText.text = 'Suzana te guia pela terra vermelha, enquanto o vento bate em seu rosto. No horizonte, é possível ver uma pequena multidão fervilhante. Com expectativa, você aperta os passos já imaginando tudo aquilo que pode estar acontecendo.'
	$ChatPop.play("ChatPop")
	



func start():
	$ChatBox.start()


func _on_ChatBox_close_chat():
	dialog_number += 1
	if dialog_number == 1:
		$ChatBox.hide()
		$Timer1.start()
	else:
		emit_signal("end_multidao", "multidao")
	pass # Replace with function body.


func _on_Timer1_timeout():
	$Timer1.stop()
	$Transition.play("Transition")
	pass # Replace with function body.


func _on_Transition_animation_finished(anim_name):
	$ChatBox/ChatText.text = 'Você escuta uma voz imponente vindo do centro do grupo de trabalhadores. Se apertando entre as pessoas você procura por uma brecha para ver tudo que está acontecendo e descobrir a face de quem fala.'
	$ChatPop.play("ChatPop")
	$ChatBox.visible = true
	pass # Replace with function body.
