extends CanvasLayer

var player_data

func load_backpack_structure():
	player_data = $Player.read()
	if $Player.player_exists():
		$BackPack.texture = load(player_data["backpack"])
		$DiaryInventory.load_diary_statements()

func _ready():
	load_backpack_structure()

func _on_TextureButton_pressed():
	player_data = $DiaryInventory/PlayerEntitiy.read()
	
	if $DiaryInventory.visible == true:
		$DiaryHideAnimation.play("DiaryHide")
	else:
		$DiaryInventory.visible = true
		$DiaryPopAnimation.play("DiaryPop")
	$BackPackSoundEffect.play()

func _process(delta):
	$BackPackSoundEffect.update("soundeffect")
	
func _on_DiaryPopAnimation_animation_started(anim_name):
	$BackPack/BackPackButton.visible = false
	
func _on_DiaryHideAnimation_animation_started(anim_name):
	$BackPack/BackPackButton.visible = false
	
func _on_DiaryHideAnimation_animation_finished(anim_name):
	$DiaryInventory.visible = false
	$BackPack/BackPackButton.visible = true

func _on_DiaryPopAnimation_animation_finished(anim_name):
	$BackPack/BackPackButton.visible = true

func _on_BackPackBeating_animation_finished(anim_name):
	$BackPack.scale = Vector2(0.203,0.203)
