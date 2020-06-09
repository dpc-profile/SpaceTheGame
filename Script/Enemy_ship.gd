extends KinematicBody2D

export var velx = 60
var mov = Vector2(0,0)

func _ready():
	add_to_group("player2")

#comentando o 'mov = move_and_slide(mov)' o inimigo não se mexe
func _process(delta):
	mov.x = velx
	mov.y = 0
	look_at(Global.player_global_pos)
	mov = mov.rotated(rotation)
	mov = move_and_slide(mov)
	
	
func recebendo_dano(dano):
	return
