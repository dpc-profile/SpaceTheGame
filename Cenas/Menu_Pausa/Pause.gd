extends Control


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
	get_tree().change_scene("res://Cenas/TelaMenu/TitleScream.tscn")
	

		

#Volume do som no jogo in game
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
	if value == -34:
		AudioServer.set_bus_mute(1,true)
	else: 
		AudioServer.set_bus_mute(1,false)
	
	pass # Replace with function body.
