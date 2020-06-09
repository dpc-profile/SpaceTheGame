extends KinematicBody2D
#class_name Mob

signal removed

var speed = 50
var mov = Vector2(0,0)

var minimap_icon = "mob"

func _process(delta):
	mov.x = speed
	mov.y = 0
	look_at(Global.player_global_pos)
	mov = mov.rotated(rotation)
	mov = move_and_slide(mov)
	
#func _ready():
#	rotation = rand_range(0, 2*PI)

#func _physics_process(delta):
#	velocity = transform.x * speed
#	var collision = move_and_collide(velocity * delta)
#	if collision:
#		velocity = velocity.bounce(collision.normal).rotated(rand_range(-PI/4, PI/4))
#	rotation = velocity.angle()
	
func recebendo_dano(damage):
	$ProgressBar.value -= damage
	#chama a tela de GAME OVER
	if($ProgressBar.value == 0):
		get_tree().change_scene("res://Cenas/Game_over.tscn")


