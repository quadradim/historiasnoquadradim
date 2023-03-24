extends CanvasLayer
var player_choice = []
var correct_choice = ["Reivindicação por empregos","Ato contra a miséria","Justiça por melhores condições de trabalho"]
signal end_word_selection_2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$TryButton.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Word1Button_pressed():
	var font = $Panel.get("custom_styles/panel")
	if $Panel["custom_styles/panel"].bg_color == Color("#154965"):
		print("dale")
		font.bg_color = Color("#34bb0e")
	pass # Replace with function body.
