extends Button

#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over



func _on_MultiplayerOptionButton_mouse_entered():
	#muda a cor	
	set_modulate(mouse_over)
	#muda o tamanho	
	set_scale(Vector2(1,1))


func _on_MultiplayerOptionButton_mouse_exited():
	#muda a cor	
	set_modulate(mouse_out)
	#muda o tamanho	
	set_scale(Vector2(1,1))

func _on_MultiplayerOptionButton_pressed():
	Network.MULTIPLAYER_ON = true
	get_tree().change_scene("res://Cenas/TelaMenu/Tela_Nome.tscn")
