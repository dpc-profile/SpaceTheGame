extends KinematicBody2D
#class_name Mob

signal removed
var cena_bala = preload("res://Cenas/tiroInimigo.tscn")
var speed = 100
var mov = Vector2(0,0)
var minimap_icon = "mob"
var na_area = false

func _physics_process(delta):
	mov.x = speed
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
	#Remover o enemy do minimapa
	emit_signal("removed", self)
	queue_free()
	#Esconde o inimigo ou player da cena,
	#Usado pra situação de respawn
#	set_physics_process(false)
#	for child in get_children():
#		if child.has_method('hide'):
#			child.hide()
#	$CollisionPolygon2D.disabled = true
#	global_position = Vector2(-1000, 0)



func _on_Visao_body_entered(body):
	if body.is_in_group("player1"):
		na_area = true

func _on_Visao_body_exited(body):
	if body.is_in_group("player1"):
		na_area = false

func _on_FireRate_timeout():
	if na_area:
		disparar()

func disparar():
	var bala = cena_bala.instance()
	bala.global_position = $BulletPointEnemy.global_position
	bala.rotation = rotation + 4.8
	get_tree().root.add_child(bala)
