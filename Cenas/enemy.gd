extends KinematicBody2D
#class_name Mob

signal removed

var speed = 50
var mov = Vector2(0,0)

var minimap_icon = "mob"

func _physics_process(delta):
	mov.x = speed
	mov.y = 0
	if Global.player_global_pos != null:
		look_at(Global.player_global_pos)
	#Rotation_degress gira toda a cena
	rotation_degrees = rotation_degrees + 90
	mov = mov.rotated(rotation-45)
	mov = move_and_slide(mov)
	
func recebendo_dano(damage):
	$ProgressBar.value -= damage
	if($ProgressBar.value <= 0):
		dead()

func dead():
	set_physics_process(false)
	for child in get_children():
		if child.has_method('hide'):
			child.hide()
	$CollisionPolygon2D.disabled = true
	global_position = Vector2(-1000, 0)
	#Remover o enemy do minimapa
#	remove_from_group("mobs")
#	remove_from_group("minimap_objects")

