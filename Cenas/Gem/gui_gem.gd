extends Node2D


func _process(delta):
	var gui_collected = Global.collected
	if(gui_collected==true):
		self.visible = true
	else:
		self.visible = false
