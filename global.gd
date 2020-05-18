extends Node

var collected 
var status
var gem = "die"

func _ready():
	 pass

func collected_gem(gem_collected):
	collected = gem_collected
	
#Faz o Kinematic Body sumir
func kill_gem_body():
	 status = gem
	
	
