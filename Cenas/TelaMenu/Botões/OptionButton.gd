extends Button
#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_OptionButton_mouse_entered():
#muda a cor	
	set_modulate(mouse_over)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_OptionButton_mouse_exited():
		#muda a cor	
	set_modulate(mouse_out)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.
