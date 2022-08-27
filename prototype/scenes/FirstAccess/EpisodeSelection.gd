extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var locked_episodes =  [1,0,0]
var current_episode =  [1,0,0]
var episode_number = 0
var episodes = ["Núcleo" ,"Taguatinga","PlanoPiloto"]
# Called when the node enters the scene tree for the first time.
func _ready():
	print(episodes[0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonNext_pressed():
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
			$Padlock.visible = true
		else:
			$PlayableColor.visible = true
			$LockedColor.visible = false
			$Padlock.visible = false
	pass # Replace with function body.


func _on_ButtonBack_pressed():
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
			$Padlock.visible = true
		else:
			$PlayableColor.visible = true
			$LockedColor.visible = false
			$Padlock.visible = false
	pass # Replace with function body.
