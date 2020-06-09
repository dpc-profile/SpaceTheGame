extends Node

var collected 
var status
var gem = "die"
var pickable_gem

#determina se a gema foi coletada
func collected_gem(gem_collected):
	collected = gem_collected
	
#Faz o Kinematic Body sumir
func kill_gem_body():
	 status = gem

func ellegible_pickable(pickable):
	pickable_gem = pickable
