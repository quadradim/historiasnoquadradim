extends CanvasLayer

var player_data
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player_data = $DiaryInventory/PlayerEntitiy.read()
	$BackPack.texture = load(player_data["backpack"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	if $DiaryInventory.visible == true:
		$DiaryHideAnimation.play("DiaryHide")
	else:
		$DiaryInventory.visible = true
		$DiaryPopAnimation.play("DiaryPop")
	pass # Replace with function body.

func _on_DiaryPopAnimation_animation_started(anim_name):
	$BackPack/BackPackButton.visible = false
	pass # Replace with function body.
	
func _on_DiaryHideAnimation_animation_started(anim_name):
	$BackPack/BackPackButton.visible = false
	pass # Replace with function body.
	
func _on_DiaryHideAnimation_animation_finished(anim_name):
	$DiaryInventory.visible = false
	$BackPack/BackPackButton.visible = true
	pass # Replace with function body.

func _on_DiaryPopAnimation_animation_finished(anim_name):
	$BackPack/BackPackButton.visible = true
	pass # Replace with function body.


func _on_BackPackBeating_animation_finished(anim_name):
	$BackPack.scale = Vector2(0.203,0.203)
	pass # Replace with function body.
