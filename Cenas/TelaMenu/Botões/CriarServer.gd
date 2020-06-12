extends Button
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

func _on_CriarServer_mouse_entered():
	#muda a cor	
	set_modulate(mouse_over)
	#muda o tamanho	
	set_scale(Vector2(1,1))


func _on_CriarServer_mouse_exited():
	#muda a cor	
	set_modulate(mouse_out)
	#muda o tamanho	
	set_scale(Vector2(1,1))
