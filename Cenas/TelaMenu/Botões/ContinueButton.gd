extends Button
#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_fora
export (Color, RGB) var mouse_dentro

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_ContinueButton_mouse_entered():
#muda a cor	
	set_modulate(mouse_dentro)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_ContinueButton_mouse_exited():
#muda a cor	
	set_modulate(mouse_fora)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_Sair_pressed():
	get_tree().quit()
	pass 
