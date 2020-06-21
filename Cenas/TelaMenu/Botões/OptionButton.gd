extends Button
#variáveis para mudança de cores dos botões
export (Color, RGB) var mouse_fora
export (Color, RGB) var mouse_dentro

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_OptionButton_mouse_entered():
	get_node("/root/menu_musica/Som_botoes").play()
#muda a cor	
	set_modulate(mouse_dentro)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_OptionButton_mouse_exited():
#muda a cor	
	set_modulate(mouse_fora)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_OptionButton_pressed():
	get_tree().change_scene("res://Cenas/TelaOpções/Options.tscn")
	
	pass # Replace with function body.
