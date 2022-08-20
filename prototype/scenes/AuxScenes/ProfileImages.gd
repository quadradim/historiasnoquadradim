extends Node2D

var texture = ImageTexture.new()
var image = Image.new()
export var images = ["res://assets/Images/Cenas/Lupa.png"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChatBox_player_dialog():
	image.load("res://assets/Images/Cenas/Lupa.png")
	texture.create_from_image(image)
	$Background/Image.texture = image
	pass # Replace with function body


func _on_ChatBox_suzana_dialog():
	pass # Replace with function body.
