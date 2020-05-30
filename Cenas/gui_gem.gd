extends Node2D


func _ready():
	pass 
func _process(delta):
	return #impede que o codigo rode e quebre o jogo
	var gui_collected = $"/root/global".collected
	if(gui_collected==true):
		self.visible = true
	else:
		self.visible = false
