extends Node

signal end_production

# export (String) var name = "default"

func _on_OpeningDuration_timeout():
	emit_signal("end_production", "logo_opening")
