extends Node2D

var segundos = 0
var minutos = 0 

func _ready():
	#conecta o sinal de removed emitido pelos mobs/gema com o minimap
	for object in get_tree().get_nodes_in_group("minimap_objects"):
		object.connect("removed", $CanvasLayer/MiniMap, "_on_object_removed")


func _on_Timer_timeout():
	segundos += 1
	pega_tempo.pega_seg = segundos
	get_node("Tempo_menu").set_text("Tempo de jogo:\n" + str(segundos) + " Segundos\n" + str(minutos) + " Minutos")
	if segundos == 60:
		minutos +=01
		pega_tempo.pega_min = minutos
		segundos = 0
	
	
	pass # Replace with function body.
