extends KinematicBody2D
#class_name Mob

signal removed

var speed = 50
var mov = Vector2(0,0)

var minimap_icon = "mob"

func _physics_process(delta):
	mov.x = speed
	mov.y = 0
	look_at(Global.player_global_pos)
	#Rotation_degress gira toda a cena
	rotation_degrees = rotation_degrees + 90
	mov = mov.rotated(rotation-45)
	mov = move_and_slide(mov)
	
	
func recebendo_dano(damage):
	$ProgressBar.value -= damage
<<<<<<< Updated upstream
	#chama a tela de GAME OVER
	if($ProgressBar.value == 0):
		get_tree().change_scene("res://Cenas/Game_over.tscn")


=======
	if($ProgressBar.value <= 0):
		queue_free()
>>>>>>> Stashed changes
