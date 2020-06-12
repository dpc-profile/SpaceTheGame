extends Node2D

# export var life_player = $life_player.value

# Called when the node enters the scene tree for the first time.
func _ready():
	$life_player.value = 50
	
func recebendo_dano(damage):
	$life_player.value -= damage
