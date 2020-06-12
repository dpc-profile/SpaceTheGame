extends Node2D


func _process(delta):
	#pega o status atual da bandeira
	var gui_collected = Global.collected
	#verifica se a bandeira deve aparecer para player
	if(gui_collected==true):
		self.visible = true
	else:
		self.visible = false
