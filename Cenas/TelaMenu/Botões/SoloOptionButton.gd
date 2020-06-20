extends Button

#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_fora
export (Color, RGB) var mouse_dentro



func _on_SoloOptionButton_mouse_entered():
	#muda a cor	
	set_modulate(mouse_dentro)
	#muda o tamanho	
	set_scale(Vector2(1,1))


func _on_SoloOptionButton_mouse_exited():
	#muda a cor	
	set_modulate(mouse_fora)
	#muda o tamanho	
	set_scale(Vector2(1,1))


func _on_SoloOptionButton_pressed():
	get_tree().change_scene("res://Cenas/TelaMenu/Tela_Nome.tscn")
