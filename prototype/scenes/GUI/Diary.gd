extends CanvasLayer

var player_data
signal end_diary
var locked_characters = [1,0,0,0,0,0,0,0,0]

func _ready():
	if bool(locked_characters[0]) == false:
		$CharactersTab/Character1.texture = null
	if bool(locked_characters[1]) == false:
		$CharactersTab/Character2.texture = null
	if bool(locked_characters[2]) == false:
		$CharactersTab/Character3.texture = null
	if bool(locked_characters[3]) == false:
		$CharactersTab/Character4.texture = null
	if bool(locked_characters[4]) == false:
		$CharactersTab/Character5.texture = null
	if bool(locked_characters[5]) == false:
		$CharactersTab/Character6.texture = null
	if bool(locked_characters[6]) == false:
		$CharactersTab/Character7.texture = null
	if bool(locked_characters[7]) == false:
		$CharactersTab/Character8.texture = null
	if bool(locked_characters[8]) == false:
		$CharactersTab/Character9.texture = null
	
	player_data = $PlayerEntitiy.read()
	
	# Load backpack
	$ProfileTab/BackpackPanel/Backpack.texture = load(player_data["backpack"])
	
	# Load Habilities
	$ProfileTab/ItemPanel01/hability.texture = load(player_data["habilities"][0][0])
	$ProfileTab/ItemPanel02/hability.texture = load(player_data["habilities"][1][0])
	$ProfileTab/ItemPanel03/hability.texture = load(player_data["habilities"][2][0])
	
	# Load Name
	$ProfileTab/HistorianName.text = player_data["name"]
	
	# New Message Popup
	$FirstAccessMessage.popup()
	$FirstAccessMessageAnimation.play("NewGame")

func _process(delta):
	$MainMusic.update("soundtrack")

func _on_Button_pressed():
	emit_signal("end_diary", "travel_scene")

func play_music():
	return $MainMusic

func music_finished():
	$MainMusic.play()


func _on_PlayerButton_pressed():
	$ProfileTab.visible = true
	$MapTab.visible = false
	$CharactersTab.visible = false
	pass # Replace with function body.


func _on_MapButton_pressed():
	$ProfileTab.visible = false
	$MapTab.visible = true
	$CharactersTab.visible = false
	pass # Replace with function body.


func _on_CharactersButton_pressed():
	$ProfileTab.visible = false
	$MapTab.visible = false
	$CharactersTab.visible = true
	pass # Replace with function body.


func _on_Character1Button_pressed():
	$CharactersTab/CharacterZoom.texture = $CharactersTab/Character1.texture
	$CharactersTab/CharacterZoom.scale = Vector2(0.316,0.316)
	$CharactersTab/DescriptionText.text = ("Dona Suzana")
	pass # Replace with function body.


func _on_City1Button_pressed():
	$MapTab/CityDescription.text = ("Núcleo Bandeirante")
	pass # Replace with function body.


func _on_City2Button_pressed():
	$MapTab/CityDescription.text = ("Taguatinga")
	pass # Replace with function body.


func _on_City3Button_pressed():
	$MapTab/CityDescription.text = ("Plano Piloto")
	pass # Replace with function body.
