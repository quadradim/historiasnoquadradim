extends CanvasLayer

signal end_suzana_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	$MainMusic.update("soundtrack")
	
func play_music():
	return $MainMusic

func _on_ChatBox_new_dialog():
	$ChatBox.get_text()
	
func start():
	$ChatBox.start()

func end_suzana_scene():
	emit_signal("end_suzana_scene", "intro_multidao")




	pass # Replace with function body.


func _on_ChatBox_change_face1():
	$SuzanaExpression1.visible = true
	$SuzanaExpression2.visible = false
	$SuzanaExpression3.visible = false
	$SuzanaExpression4.visible = false
	pass # Replace with function body.


func _on_ChatBox_change_face2():
	$SuzanaExpression1.visible = false
	$SuzanaExpression2.visible = true
	$SuzanaExpression3.visible = false
	$SuzanaExpression4.visible = false
	pass # Replace with function body.


func _on_ChatBox_change_face3():
	$SuzanaExpression1.visible = false
	$SuzanaExpression2.visible = false
	$SuzanaExpression3.visible = true
	$SuzanaExpression4.visible = false
	pass # Replace with function body.


func _on_ChatBox_change_face4():
	$SuzanaExpression1.visible = false
	$SuzanaExpression2.visible = false
	$SuzanaExpression3.visible = false
	$SuzanaExpression4.visible = true
	pass # Replace with function body.
