extends Area2D

var collected = false
var ellegible_pickable


func _ready():
	$animation.play("home");

#detecta se o Player toca
func _on_ghost_gem_body_entered(body):
	if body.name == "player2":
		collected = true
		$"/root/global".collected_gem(collected)
		
		$"/root/global".kill_gem_body()
		

