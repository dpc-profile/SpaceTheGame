extends Button
#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_NewGameButton_mouse_entered():
	#muda a cor	
	set_modulate(mouse_over)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_NewGameButton_mouse_exited():
		#muda a cor	
	set_modulate(mouse_out)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://Cenas/TelaMenu/Tela_Nome.tscn")
	pass # Replace with function body.
