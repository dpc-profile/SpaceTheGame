extends Area2D

export var team = 0
var verificar


func _on_gem_spawn_body_entered(body):
	
	if((get_node("/root/pega_Nome").player_Nome == Global.gem_holder) and Global.collected == true):
		if(team==1):
			verificar = true
			Global.ganhou(verificar)
			
			print("youu winnn "+get_node("/root/pega_Nome").player_Nome)
			
		else:
			print("perdeu")
			