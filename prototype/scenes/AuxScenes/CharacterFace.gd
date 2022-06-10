extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	_draw()
	_desenho()
	pass # Replace with function body.


func _draw():
	var cen = Vector2 (700,300)
	var rad = 100
	var col = Color(0.4,0.63,0.86,1)
	draw_circle(cen,rad,col)

func _desenho():
	var cen = Vector2 (600,300)
	var rad = 90
	var col = Color(0.64,0.58,0.44,1)
	draw_circle(cen,rad,col)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
