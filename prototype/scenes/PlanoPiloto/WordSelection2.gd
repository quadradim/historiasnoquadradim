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
		
func create_default_style():
	for i in range(max_options):
		options[i]["custom_styles/panel"].bg_color = Color(
			0.3568627450980392, 0.5333333333333333, 0.6745098039215687, 0.5
		)
		options[i]["custom_styles/panel"].corner_radius_bottom_left = 10
		options[i]["custom_styles/panel"].corner_radius_bottom_right = 10
		options[i]["custom_styles/panel"].corner_radius_top_left = 10
		options[i]["custom_styles/panel"].corner_radius_top_right = 10

func _ready():
	player_data = $Player.read()
	$TryButton.disabled = true
	
	get_elements()
	connect_signal_options()
	
	create_default_style()
	
func _process(delta):
	if selections == len(correct_choice_indexes):
		$TryButton.disabled = false

func give_hint():
	for index in range(len(pressed_buttons)):
		if pressed_buttons[index] and not(index in correct_choice_indexes):
			$MessageBox/MessageText.text = "Palavra "+selection_names[index]+" incorreta"
			$MessageBox.popup()
			break


func _on_UnlockedSkill_popup_hide():
	emit_signal("end_word_selection_2", "retrospectiva")
	
##########################################
func get_total_selections():
	selections = 0
	for element in pressed_buttons:
		selections += int(element == true)

func option_pressed(option_id):
	if not pressed_buttons[option_id]:
		options[option_id]["custom_styles/panel"].bg_color = Color(
			0.3568627450980392, 0.5333333333333333, 0.6745098039215687, 1.0
		) 
		pressed_buttons[option_id] = true
	else:
		options[option_id]["custom_styles/panel"].bg_color = Color(
			0.3568627450980392, 0.5333333333333333, 0.6745098039215687, 0.5
		)
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




func _on_TryButton_button_down():
	var won = true
	if selections == len(correct_choice_indexes):
		for element in correct_choice_indexes:
			if not pressed_buttons[element]:
				won = false
				break
	else:
		won = false

	if won:
		$Player.modifier("ability",[1,1,1,1,0,1,1,1,1])
		
#		$PlayerBackPack/DiaryInventory._ready()
		$Fade_Popup.popup()
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
		
	else:
		tries += 1

		$MessageBox/MessageText.text = "Resposta incorreta, tente novamente"
		$MessageBox.popup()
		
		if tries > 5:
			give_hint()
	pass # Replace with function body.
