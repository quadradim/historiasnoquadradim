extends CanvasLayer

var player_data

func _ready():
	player_data = $PlayerEntitiy.read()
	
	# Load backpack
	$ImagesTab/ProfileTab/BackpackPanel/Backpack.texture = load(player_data["backpack"])
	
	# Load Habilities
	$ImagesTab/ProfileTab/ItemPanel01/hability.texture = load(player_data["habilities"][0][0])
	$ImagesTab/ProfileTab/ItemPanel02/hability.texture = load(player_data["habilities"][1][0])
	$ImagesTab/ProfileTab/ItemPanel03/hability.texture = load(player_data["habilities"][2][0])
	
	# Load Name
	$ImagesTab/ProfileTab/HistorianName.text = player_data["name"]
	
	# New Message Popup
	$FirstAccessMessage.popup()
	$FirstAccessMessageAnimation.play("NewGame")


func _on_Button_pressed():
	emit_signal("end_diary")
