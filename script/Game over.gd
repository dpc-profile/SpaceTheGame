extends Node2D
onready var timer = get_node("Timer")
var segundos = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(1.1) #duração do timer 1 segundo
	timer.start()
	
		
func _on_Timer_timeout():
	#TEM QUE FICAR SEGURANDO ESPAÇO KKKKK
	if(Input.is_action_pressed("ui_select")):
		segundos -= 1
		get_node("Contador").set_text(str(segundos))
		if segundos == -1:
			get_tree().change_scene("res://Cenas/Mapa.tscn")
