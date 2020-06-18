extends Area2D

#define que a gema assim que é gerada não foi coletada
var collected = false

func _ready():
	$animation.play("home");

#detecta se o Player toca
func _on_ghost_gem_body_entered(body):
	if (body.name == "player2" and Global.pickable_gem):
		Global.gem_holder = get_node("/root/pega_Nome").player_Nome
		collected = true
		Global.collected_gem(collected)
		Global.kill_gem_body()
		
#animações
func _on_Timer_ready():
	$animation.play("to_home")
	
func _on_Timer_timeout():
	$animation.play("move_home")

