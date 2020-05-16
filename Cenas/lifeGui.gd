extends Node2D

# export var life_player = $life_player.value


# Called when the node enters the scene tree for the first time.
func _ready():
	$life_player.value = 50
	pass # Replace with function body.


func recebendo_dano(damage):
	$life_player.value -= damage
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
