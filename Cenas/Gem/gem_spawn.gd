extends Area2D

export var team = 0
var verificar
var picked = false

func _on_gem_spawn_body_entered(body):
	if(picked == false):
		$picked.play()
	picked = true
	if((get_node("/root/pega_Nome").player_Nome == Global.gem_holder) and Global.collected == true):
		if(team==1):
			verificar = true
			Global.ganhou(verificar)
			
			
			
