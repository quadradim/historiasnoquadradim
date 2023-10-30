extends CanvasLayer

signal end_folheto_raulino


func _ready():
	pass

func _process(delta):
	$MainMusic.update("soundtrack")
	
func _on_Continuar_button_down():
	emit_signal("end_folheto_raulino","raulino2_dialog")
