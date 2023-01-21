extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var b = false
var j = false
var p = false

signal dialog_selected


# Called when the node enters the scene tree for the first time.
func _ready():
	$FirstAccessMessage/MessageText.text = ("""Você se depara com um grande movimento em Taguatinga e, ao caminhar em meio à multidão de pessoas, encontra no chão um caderno com uma capa de couro e um nome na capa.
	 Resgate o caderno.""")
	$FirstAccessMessage.popup()
	$FirstAccessMessageAnimation.play("NewGame")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	$NotebookWind.popup()
	$Caderno.visible = false
	pass # Replace with function body.


func _on_FirstAccessMessage_popup_hide():

	pass # Replace with function body.


func _on_NotebookWind_popup_hide():
	$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	$FirstAccessMessage/MessageText.text = ("""Olhando ao seu redor, você busca o dono do caderno.""")
	$FirstAccessMessage.popup()
	$FirstAccessMessageAnimation.play("NewGame")
	$Timer.stop()
	pass # Replace with function body.
