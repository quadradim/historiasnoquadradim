extends CanvasLayer

export (Array, Resource) var img
var current_image = 0

signal end_analyze

func _ready():
	$PhotoPanel/image.texture = img[current_image]

func next_image():
	if current_image + 1 < len(img):
		current_image += 1
		$PhotoPanel/image.texture = img[current_image]

func previous_image():
	if current_image - 1 >= 0:
		current_image -= 1
		$PhotoPanel/image.texture = img[current_image]

func exit():
	emit_signal("end_analyze")
