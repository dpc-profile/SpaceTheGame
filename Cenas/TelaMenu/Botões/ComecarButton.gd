extends Button
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

var player = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Comecar_mouse_entered():
			
#muda a cor	
	set_modulate(mouse_over)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.


func _on_Comecar_mouse_exited():
#muda a cor	
	set_modulate(mouse_out)
#muda o tamanho	
	set_scale(Vector2(1,1))
	pass # Replace with function body.



