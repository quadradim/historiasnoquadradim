extends CanvasLayer

signal end_taguatinga
var b = false
var j = false
var p = false
var cont = 0
onready var h = get_node("/root/Global")
func _ready():
	cont = h.counter
	if cont != null:
		$Caderno.visible = false
	if cont == 5:
		$FadeInMultidao.play("FadeIn")
		$Multidao.visible = true
		
	$FirstTimer.start()
	$JoseMiguel.modulate = "ffffff"
	$DistratorPolicial.modulate = "ffffff"
	$ChefeDePolicia.modulate = "ffffff"

func _on_TextureButton_pressed():
	$NotebookWind.popup()
	$Caderno.visible = false

func _on_NotebookWind_popup_hide():
	$Timer.start()

func _on_ChatBox_close_chat():
	$ChatBox.hide()

func _on_Timer_timeout():
	$ChatBox/ChatText.text = 'Olhando ao seu redor, você busca o dono do caderno.'
	$ChatPop.play("ChatPop")
	$ChatBox.visible = true
	
	cont = 1
	$JoseMiguel/JoseButton.visible = true
	$Timer.stop()

func _on_JosButton_pressed():
	if cont == 1:
		emit_signal("end_taguatinga","jose_dialog")

func _on_DistratorButton_pressed():
	if cont == 2:
		emit_signal("end_taguatinga","policial_distrator_dialog")

func _on_ChafeButton_pressed():
	if cont == 3:
		emit_signal("end_taguatinga","chefe_de_policia_dialog")

func _on_FirstTimer_timeout():
	if cont == null:
		$ChatBox/ChatText.text = 'Você se depara com um grande movimento em Taguatinga e, ao caminhar em meio à multidão de pessoas, encontra no chão um caderno com uma capa de couro e um nome na capa. Resgate o caderno.'
		$ChatPop.play("ChatPop")
		$ChatBox.visible = true
	if cont == 4:
		$ChatBox/ChatText.text = 'Mais uma vez, você se encontra diante de uma multidão. Andando até ela, você escuta várias vozes acaloradas e procurapor alguém que possa te explicar melhor as reivindicações a fim de coletar informações'
		$ChatPop.play("ChatPop")
		$ChatBox.visible = true
		$FadeInMultidao.play("FadeIn")
		$Multidao.visible = true
	if cont == 5:
		$Multidao/Raulino/RaulinoButton.visible = true
	$FirstTimer.stop()

func _on_DistratorTrabalhadorButton_pressed():
	emit_signal("end_taguatinga","distrator_trabalhador_dialog")

func _on_RaulinoButton_pressed():
	emit_signal("end_taguatinga","raulino_dialog")
