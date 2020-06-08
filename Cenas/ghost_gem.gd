extends Area2D

class_name Alert
signal removed
var minimap_icon="alert"

var collected = false
var ellegible_pickable

func _ready():
	$animation.play("home");

#detecta se o Player toca
func _on_ghost_gem_body_entered(body):
	if body.name == "player2":
		emit_signal("removed", self)
		collected = true
		Global.collected_gem(collected)
		Global.kill_gem_body()
		
