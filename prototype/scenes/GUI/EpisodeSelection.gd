extends CanvasLayer

signal level1
signal level2
signal level3
signal end_episode_selection

var locked_episodes =  [1,0,0]
var current_episode =  [1,0,0]
var episode_number = 0
var episodes = ["Núcleo" ,"Taguatinga","PlanoPiloto"]

func _ready():
	pass 

func next_pressed():
	if episode_number < 2:
		episode_number += 1
		current_episode[episode_number] = current_episode[episode_number - 1]
		current_episode[episode_number - 1] = 0
		$Level1.visible = bool(current_episode[0])
		$Level1Text.visible = bool(current_episode[0])
		$Level2.visible = bool(current_episode[1])
		$Level2Text.visible = bool(current_episode[1])
		$Level3.visible = bool(current_episode[2])	
		$Level3Text.visible = bool(current_episode[2])
		if bool(locked_episodes[episode_number]) == false:
			$PlayableColor.visible = false
			$LockedColor.visible = true
			$Level1Text.visible = false
			$Level2Text.visible = false
			$Level3Text.visible = false
			$Padlock.visible = true
		else:
			$PlayableColor.visible = true
			$LockedColor.visible = false
			$Padlock.visible = false

func back_pressed():
	if episode_number > 0:
		episode_number -= 1
		current_episode[episode_number] = current_episode[episode_number + 1]
		current_episode[episode_number + 1] = 0
		$Level1.visible = bool(current_episode[0])
		$Level1Text.visible = bool(current_episode[0])
		$Level2.visible = bool(current_episode[1])
		$Level2Text.visible = bool(current_episode[1])
		$Level3.visible = bool(current_episode[2])	
		$Level3Text.visible = bool(current_episode[2])
		if bool(locked_episodes[episode_number]) == false:
			$PlayableColor.visible = false
			$LockedColor.visible = true
			$Level1Text.visible = false
			$Level2Text.visible = false
			$Level3Text.visible = false
			$Padlock.visible = true
		else:
			$PlayableColor.visible = true
			$LockedColor.visible = false
			$Padlock.visible = false

func select_level():
	if bool(current_episode[0]) and bool(locked_episodes[0]):
		print("level1")
		emit_signal("end_episode_selection", "level1")
	if bool(current_episode[1]) and bool(locked_episodes[1]):
		print("level2")
		emit_signal("end_episode_selection", "level2")
	if bool(current_episode[2]) and bool(locked_episodes[2]):
		print("level3")
		emit_signal("end_episode_selection", "level3")

func back_menu():
	emit_signal("end_episode_selection", "menu")
