extends Node

var collected 
var status
var gem = "die"

#recebe a posição global do nave_player2
var player_global_pos

func collected_gem(gem_collected):
	collected = gem_collected
	
#Faz o Kinematic Body sumir
func kill_gem_body():
	 status = gem
	
