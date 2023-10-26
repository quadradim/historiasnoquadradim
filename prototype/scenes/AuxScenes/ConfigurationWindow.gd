extends CanvasLayer

signal exit_button
signal back_menu

var player_data

func convert_func(input):
	# input = [-60, 24]
	# output = [0, 100]
	
	var alfa = 100/84
	var beta = 60*alfa
	if alfa*input+beta != 0:
		# Some bug that doesn't calculate 
		# the value correctly, so I added 16.
		return alfa*input+beta+16
	return 0

func update_volume():
	$PanelConfig/Soundeffect/volume.text = str(
		convert_func($PanelConfig/Soundeffect.value)
	)
	$PanelConfig/Soundtrack/volume.text = str(
		convert_func($PanelConfig/Soundtrack.value)
	)
	$PanelConfig/AudioDescription/volume.text = str(
		convert_func($PanelConfig/AudioDescription.value)
	)
	
func _ready():
	if $PlayerEntity.player_exists():
		player_data = $PlayerEntity.read()
		$PanelConfig/Soundeffect.value = player_data["soundeffect"]
		$PanelConfig/Soundtrack.value = player_data["soundtrack"]
		$PanelConfig/AudioDescription.value = player_data["audio_description"]
	else:
		$PanelConfig/Soundeffect.value = 0
		$PanelConfig/Soundtrack.value = 0
		$PanelConfig/AudioDescription.value = 0
		
	update_volume()
	
func _process(_delta):
	player_data = $PlayerEntity.read()
	update_volume()

func get_soundeffect():
	return $PanelConfig/Soundeffect

func get_soundtrack():
	return $PanelConfig/Soundtrack

func button_pressed():
	emit_signal("exit_button")

func change_soundeffect(value):
	player_data["soundeffect"] = value
	$PlayerEntity.insert(player_data)

func change_soundtrack(value):
	player_data["soundtrack"] = value
	$PlayerEntity.insert(player_data)
	
func change_audiodescription(value):
	player_data["audio_description"] = value
	$PlayerEntity.insert(player_data)

func menu_button_pressed():
	emit_signal("back_menu")
