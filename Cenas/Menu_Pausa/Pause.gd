extends Control



var segundos = 0
var minutos = 0 






# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Apertar ESC para pausar o jogo
func _process(delta):
	if(Input.is_action_just_pressed("Pausar")):
		get_tree().paused = not get_tree().paused
		visible = not visible
	
	pass

#Continua o jogo da onde parou
func _on_Continuar_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	
	pass # Replace with function body.



func _on_Opcoes_pressed():
	get_node("/root/menu_musica/")
	pass # Replace with function body.



#Sair do jogo
func _on_Sair_do_jogo_pressed():
	get_tree().quit()
	pass # Replace with function body.





func _on_Timer_timeout():
	segundos += 1
	get_node("RichTextLabel").set_text("Tempo de jogo: "+ str(minutos)+" : "+ str(segundos))
	if segundos == 60:
		minutos +=01
		
		segundos = 0
	pass # Replace with function body.
