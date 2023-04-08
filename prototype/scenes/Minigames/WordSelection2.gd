# Answers:
# - "Reivindicação por empregos"
# - "Ato contra a miséria"
# - "Justiça por melhores condições de trabalho"

extends CanvasLayer
var player_choice = []
var player_data
signal end_word_selection_2

var max_options = 5
var max_tries_without_hint = 4

var options = []
var pressed_buttons = []
var selections = 0
var tries = 0

var selection_names = [
	"Ameaça Retornista",
	"Reivindicação por empregos",
	"Ato Contra Miséria",
	"Justiça por Melhores Condições de Trabalho",
	"Golpe da Ditadura Militar",
]

var correct_choice_indexes = [1, 2, 3]

func get_elements():
	for i in range(max_options):
		var option = get_node(str(self.get_path())+"/option"+str(i+1))

		options.append(option)
		pressed_buttons.append(false)

func connect_signal_options():
	for i in range(max_options):
		options[i].get_node("button").connect('pressed', self, 'press_option'+str(i))

func _ready():
	player_data = $PlayerBackPack/DiaryInventory/PlayerEntitiy.read()
	$TryButton.disabled = true
	
	get_elements()
	connect_signal_options()
	
func _process(delta):
	if selections == len(correct_choice_indexes):
		$TryButton.disabled = false

func give_hint():
	for index in range(len(pressed_buttons)):
		if pressed_buttons[index] and not(index in correct_choice_indexes):
			$MessageBox/MessageText.text = "Palavra "+selection_names[index]+" incorreta"
			$MessageBox.popup()
			break
	
func press_try():
	var won = true
	if selections == len(correct_choice_indexes):
		for element in correct_choice_indexes:
			if not pressed_buttons[element]:
				won = false
				break
	else:
		won = false

	if won:
		$PlayerBackPack/DiaryInventory/PlayerEntitiy.modifier("ability",[1,1,1,1,0,0,0,1,1])
		emit_signal("end_word_selection_2", "menu")
#		$PlayerBackPack/DiaryInventory/PlayerEntitiy.insert(
#		{
#			"name": player_data["name"],
#			"habilities": player_data["habilities"],
#			"backpack": player_data["backpack"],
#			"ability": [1,1,1,1,0,0,0,1,1],
#			"historiometer":6,
#			"characters":1,
#			"soundtrack": player_data["soundtrack"],
#			"soundeffect": player_data["soundeffect"]
#		}
#	)
		$PlayerBackPack/DiaryInventory._ready()
		$UnlockedSkill.popup()
		
	else:
		tries += 1

		$MessageBox/MessageText.text = "Resposta incorreta, tente novamente"
		$MessageBox.popup()
		
		if tries > 5:
			give_hint()

##########################################
func get_total_selections():
	selections = 0
	for element in pressed_buttons:
		selections += int(element == true)

func option_pressed(option_id):
	if not pressed_buttons[option_id]:
		options[option_id]["custom_styles/panel"].bg_color = Color("#ff0000") 
		pressed_buttons[option_id] = true
	else:
		options[option_id]["custom_styles/panel"].bg_color = Color("#154965")
		pressed_buttons[option_id] = false
	
	get_total_selections()

# This version doesn't gave lambda functions
func press_option0():
	option_pressed(0)

func press_option1():
	option_pressed(1)

func press_option2():
	option_pressed(2)

func press_option3():
	option_pressed(3)

func press_option4():
	option_pressed(4)


