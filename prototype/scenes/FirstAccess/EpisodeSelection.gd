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
		$Nucleo.visible = bool(current_episode[0])
		$NucleoText.visible = bool(current_episode[0])
		$Taguatinga.visible = bool(current_episode[1])
		$TaguatingaText.visible = bool(current_episode[1])
		$PlanoPiloto.visible = bool(current_episode[2])	
		$PlanoPilotoText.visible = bool(current_episode[2])
		
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
		$Nucleo.visible = bool(current_episode[0])
		$NucleoText.visible = bool(current_episode[0])
		$Taguatinga.visible = bool(current_episode[1])
		$TaguatingaText.visible = bool(current_episode[1])
		$PlanoPiloto.visible = bool(current_episode[2])	
		$PlanoPilotoText.visible = bool(current_episode[2])
		
		if bool(locked_episodes[episode_number]) == false:
			$PlayableColor.visible = false
			$LockedColor.visible = true
			$Padlock.visible = true
		else:
			$PlayableColor.visible = true
			$LockedColor.visible = false
			$Padlock.visible = false
	pass # Replace with function body.
