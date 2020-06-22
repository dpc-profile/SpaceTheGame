extends Button

#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_fora
export (Color, RGB) var mouse_dentro



func _on_Botao_sair_focus_entered():
	get_node("/root/menu_musica/Som_botoes").play()
	#muda a cor	
	set_modulate(mouse_dentro)
	#muda o tamanho	
	set_scale(Vector2(1,1))

	pass # Replace with function body.


func _on_Botao_sair_focus_exited():
	#muda a cor	
	set_modulate(mouse_fora)
	#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.
