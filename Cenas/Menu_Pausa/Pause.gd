extends Control

var segundos = 0
var minutos = 0 

#Apertar ESC para pausar o jogo
func _process(delta):
	if(Input.is_action_just_pressed("Pausar")):
		get_tree().paused = not get_tree().paused
		visible = not visible

#Continua o jogo da onde parou
func _on_Continuar_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible



func _on_Opcoes_pressed():
	get_node("/root/menu_musica/")



#Sair do jogo
func _on_Sair_do_jogo_pressed():
	get_tree().quit()


func _on_Timer_timeout():
	segundos += 1
	pega_tempo.pega_seg = segundos
	get_node("Tempo_menu").set_text("Tempo de jogo:\n" + str(segundos) + " Segundos\n" + str(minutos) + " Minutos")
	if segundos == 60:
		minutos +=01
		pega_tempo.pega_min = minutos
		segundos = 0
