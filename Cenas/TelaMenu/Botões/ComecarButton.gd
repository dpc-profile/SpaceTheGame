extends Button
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

var player = ""

func _on_Comecar_mouse_entered():
	#muda a cor	
	set_modulate(mouse_over)
	#muda o tamanho	
	set_scale(Vector2(1,1))



func _on_Comecar_mouse_exited():
	#muda a cor	
	set_modulate(mouse_out)
	#muda o tamanho	
	set_scale(Vector2(1,1))
