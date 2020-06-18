extends Node2D

func _ready():
	$life_player.value = 50

func recebendo_dano(damage):
	$life_player.value -= damage
