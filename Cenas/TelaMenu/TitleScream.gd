extends Control

#Chama a chama a MusicaDoMenu
func _ready():
	get_node("/root/menu_musica/AudioStreamPlayer").play()
	$EscolhaModo.hide()
	
#Esconde a HBox do menu inicial e mostra a HBox de escolha modo Solo ou multiplayer	
func _on_NewGameButton_pressed():
	$MainChoices.hide()
	$EscolhaModo.show()

#Faz o contrario da função "_on_NewGameButton_pressed"
func _on_VoltarButton_pressed():
	$MainChoices.show()
	$EscolhaModo.hide()
