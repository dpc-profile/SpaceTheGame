extends Node2D


func _process(delta):
	#return #impede que o codigo rode e quebre o jogo
	var gui_collected = Global.collected
	if(gui_collected==true):
		self.visible = true
	else:
		self.visible = false
