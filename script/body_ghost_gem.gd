extends KinematicBody2D
#controle do momento de movimentar
var move = false
#variaveis para controle do movimento
var mov = Vector2(0,0)
var velx = 60

#se move caso o player morra
#se move caso o player morra
func _process(delta):
	
	if(move == true):
		mov.x = velx
		mov.y = 0
		var spawn= get_tree().root.get_node("Mapa/gem_spawn")
		if spawn:
			look_at(spawn.global_position)
		else:
			mov.x = 0
		mov = mov.rotated(rotation)
		mov = move_and_slide(mov)
	#mata o corpo da gema
	if (Global.status == "die" and Global.pickable_gem):
		queue_free()

#timer aguarda 4 segundos para se mover
func _on_Timer_timeout():
	move = true
	Global.ellegible_pickable(true)

