extends Control
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

var lineEdit = ""

func _on_LineEdit_text_changed(new_text):
	if lineEdit.length() < 12:
		lineEdit = new_text


func _on_Comecar_pressed():
	if lineEdit == "":#não deixa o player entrar sem um nome
		return

	_load_game()
	
func _load_game():
	get_tree().change_scene("res://Cenas/Map/Mapa_Captura_Bandeira.tscn")
	get_node("/root/menu_musica/AudioStreamPlayer").stop()#Para a MusicaDoMenu
	get_node("/root/menu_musica/Musica_CTF").play()
	pega_Nome.player_Nome = lineEdit #Pega o que foi escrito no lineedit e setta ele no script global pega_Nome.gd
