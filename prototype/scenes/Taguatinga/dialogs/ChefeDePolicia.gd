extends CanvasLayer
var player_data

signal end_chefe_de_policia_dialog

func _ready(): #tirar habilidade (habilidade ja foi desbloqueada na cena da suzana
	pass

func _on_ChatBox_end_dialog():
	var j = get_node("/root/Global")
	j.counter = 4
	emit_signal("end_chefe_de_policia_dialog","Taguatinga")
