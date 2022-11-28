extends CanvasLayer


signal end_analyze

func _ready():
	$MinigameExplanation.popup()
	$InstructionAnimation.play("Instruction")

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
	$PhotoPanel/PhotoOne/FirstClue.visible = true
	$PhotoPanel/PhotoTwo/FirstClue.visible = true
	$ClueMensage/Label.text = ("Está um tempo nublado/fechado, em que época de Brasília o clima fica assim? São poucos os meses de chuva. Os períodos comuns de chuva em Brasília são de abril até maio ou de setembro até outubro.")
	$ClueMensage.popup()
	pass # Replace with function body.


func _on_SecoondButton_button_down():
	$PhotoPanel/PhotoOne/SecondClue.visible = true
	$ClueMensage/Label.text = ("Observar como a placa está destruída, amassada ao chão e o que está escrito nela. Na placa está escrito prefeitura, mas o que se tem nesse período na capital são subprefeituras, pois as prefeituras são criadas somente após a reestruturação administrativa do Distrito Federal com a LEI Nº 4.545, DE 10 DE DEZEMBRO DE 1964.")
	$ClueMensage.popup()
	pass # Replace with function body.


func _on_ThirdButton_button_down():
	$PhotoPanel/PhotoOne/ThirdClue.visible = true
	$PhotoPanel/PhotoTwo/ThirdClue.visible = true
	$ClueMensage/Label.text = ("A grande multidão que destruiu a subprefeitura rasgou vários papéis importantes para a administração da região. Entretanto, não são quaisquer papéis. São elementos documentais marcantes relacionados à construção da capital. ")
	$ClueMensage.popup()
	pass # Replace with function body.


func _on_FourthButton_button_down():
	$PhotoPanel/PhotoOne/FourthClue.visible = true
	$PhotoPanel/PhotoTwo/FourthClue.visible = true
	$ClueMensage/Label.text = ("A caixa de água que aparece em uma imagem no telhado mas não aparece em outra, é somente perspectiva? Ou será que ela foi levada pelos manifestantes? ")
	$ClueMensage.popup()
	pass # Replace with function body.
