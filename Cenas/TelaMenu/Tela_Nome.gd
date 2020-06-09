extends Control
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over
var lineEdit = ""





func _on_LineEdit_text_changed(new_text):
	lineEdit = new_text
#Pega o que foi escrito no lineedit e setta ele no script 
#global pega_Nome.gd
	get_node("/root/pega_Nome").player_Nome = lineEdit
	pass
	


#não deixa o player entrar sem um nome
func _on_Comecar_pressed():
	if lineEdit == "":
		return
#Para a MusicaDoMenu	
	get_node("/root/menu_musica/AudioStreamPlayer").stop()
	get_tree().change_scene("res://Cenas/Mapa.tscn")
	
	pass # Replace with function body.
	

