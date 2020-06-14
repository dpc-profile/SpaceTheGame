extends Node2D
onready var timer = get_node("Timer")
var segundos = 3

#Pressionar espaço para iniciar o timer
func _process(delta):
	if(Input.is_action_just_pressed("ui_select")):
		timer.start()
	
	
#Sempre que o timer acaba, diminui 1 no segundos até
#entrar na condição do if e mudar de cena
func _on_Timer_timeout():
		segundos -= 1
		get_node("Contador").set_text(str(segundos))
		if segundos == -1:
			get_tree().change_scene("res://Cenas/Mapa_Captura_Bandeira.tscn")
