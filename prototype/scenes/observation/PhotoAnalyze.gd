extends CanvasLayer

var player_data
signal end_analyze
var clues = 0

func _ready():
	$MinigameExplanation.popup()
	$InstructionAnimation.play("Instruction")
	$Button.disabled = true

func next_image():
	if $PhotoPanel/PhotoOne.visible == true:
		$PhotoPanel/PhotoOne.visible = false
		$PhotoPanel/PhotoTwo.visible = true

func previous_image():
	if $PhotoPanel/PhotoTwo.visible == true:
		$PhotoPanel/PhotoOne.visible = true
		$PhotoPanel/PhotoTwo.visible = false

func exit():
	emit_signal("end_analyze", "lavadeiras")


func _on_MinigameExplanation_popup_hide():
	$Title.visible = true
	pass # Replace with function body.


func _on_FirstButton_button_down():
	if $PhotoPanel/PhotoOne/FirstClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/FirstClue.visible = true
	$PhotoPanel/PhotoTwo/FirstClue.visible = true
	$ClueMensage/Label.text = ("Está um tempo nublado/fechado, em que época de Brasília o clima fica assim? São poucos os meses de chuva. Os períodos comuns de chuva em Brasília são de abril até maio ou de setembro até outubro.")
	$ClueMensage.popup()
	if clues == 4:
		$PlayerBackPack/DiaryInventory/AbillityTab/HistoriometroTab/Historiomentro1.visible = true
		$Button.disabled = false
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
	pass # Replace with function body.


func _on_SecoondButton_button_down():
	if $PhotoPanel/PhotoOne/SecondClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/SecondClue.visible = true
	$ClueMensage/Label.text = ("Observar como a placa está destruída, amassada ao chão e o que está escrito nela. Na placa está escrito prefeitura, mas o que se tem nesse período na capital são subprefeituras, pois as prefeituras são criadas somente após a reestruturação administrativa do Distrito Federal com a LEI Nº 4.545, DE 10 DE DEZEMBRO DE 1964.")
	$ClueMensage.popup()
	if clues == 4:
		$PlayerBackPack/DiaryInventory/AbillityTab/HistoriometroTab/Historiomentro1.visible = true
		$Button.disabled = false
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
	pass # Replace with function body.


func _on_ThirdButton_button_down():
	if $PhotoPanel/PhotoOne/ThirdClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/ThirdClue.visible = true
	$PhotoPanel/PhotoTwo/ThirdClue.visible = true
	$ClueMensage/Label.text = ("A grande multidão que destruiu a subprefeitura rasgou vários papéis importantes para a administração da região. Entretanto, não são quaisquer papéis. São elementos documentais marcantes relacionados à construção da capital. ")
	$ClueMensage.popup()
	if clues == 4:
		$PlayerBackPack/DiaryInventory/AbillityTab/HistoriometroTab/Historiomentro1.visible = true
		$Button.disabled = false
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
	pass # Replace with function body.


func _on_FourthButton_button_down():
	if $PhotoPanel/PhotoOne/FourthClue.visible == false:
		clues += 1
	$PhotoPanel/PhotoOne/FourthClue.visible = true
	$PhotoPanel/PhotoTwo/FourthClue.visible = true
	$ClueMensage/Label.text = ("A caixa de água que aparece em uma imagem no telhado mas não aparece em outra, é somente perspectiva? Ou será que ela foi levada pelos manifestantes? ")
	$ClueMensage.popup()
	if clues == 4:
		$PlayerBackPack/DiaryInventory/AbillityTab/HistoriometroTab/Historiomentro1.visible = true
		$Button.disabled = false
		$UnlockedSkill.popup()
		$UnlockedSkillAnimation.play("Popmenssage")
	pass # Replace with function body.


func _on_UnlockedSkill_popup_hide():
	
	pass # Replace with function body.
