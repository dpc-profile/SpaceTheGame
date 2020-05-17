extends Node2D


func _ready():
	pass 
func _process(delta):
	var gui_collected = $"/root/global".collected
	if(gui_collected==true):
		self.visible = true
	else:
		self.visible = false
