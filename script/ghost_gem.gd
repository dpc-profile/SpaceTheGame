extends Area2D

var collected = false

func _ready():
	$animation.play("home");

#detecta se o Player toca
func _on_ghost_gem_body_entered(body):
	if (body.name == "player2" and Global.pickable_gem):
		collected = true
		Global.collected_gem(collected)
		Global.kill_gem_body()
	if (body.name == "gem_spawn"):
			print("work")
			$ghost_gem/animation.play("home")
		
#animações
func _on_Timer_ready():
	$animation.play("to_home")
	
func _on_Timer_timeout():
	$animation.play("move_home")
