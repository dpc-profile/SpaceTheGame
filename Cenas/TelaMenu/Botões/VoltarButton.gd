extends Button
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

func _on_Volta_mouse_entered():
	get_node("/root/menu_musica/Som_botoes").play()
#muda a cor
	set_modulate(mouse_over)
#muda o tamanho	
	set_scale(Vector2(1,1))
	
func _on_Volta_mouse_exited():
	
	set_modulate(mouse_out)
	#muda o tamanho	
	set_scale(Vector2(1,1))


func _on_Volta_pressed():
	get_tree().change_scene("res://Cenas/TelaMenu/TitleScream.tscn")


func _on_VoltarButton_pressed():
	pass # Replace with function body.


func _on_VoltarButton_mouse_entered():
	pass # Replace with function body.


func _on_VoltarButton_mouse_exited():
	pass # Replace with function body.
