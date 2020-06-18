extends KinematicBody2D
class_name Alert
signal removed
var minimap_icon="alert"
#controle do momento de movimentar
var move = false
#variaveis para controle do movimento
var mov = Vector2(0,0)
var velx = 60

func _process(delta):
	if(Global.collected==true):#Remove do minimapa
		emit_signal("removed", self)
	if (Global.status == "die" and Global.pickable_gem):
		queue_free()

#timer aguarda 4 segundos para se mover
func _on_Timer_timeout():
	move = true
	Global.ellegible_pickable(true)
