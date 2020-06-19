extends KinematicBody2D

signal removed
var cena_bala = preload("res://Cenas/Enemys/tiroInimigo.tscn")
var speed = 100
var mov = Vector2(0,0)
var minimap_icon = "mob"
var na_area = false

func _physics_process(delta):
	mov.x = speed
	if Global.player_global_pos != null:
		look_at(Global.player_global_pos)
	rotation_degrees = rotation_degrees + 90
	mov = mov.rotated(rotation-45)
	mov = move_and_slide(mov)


func recebendo_dano(damage):
	$ProgressBar.value -= damage
	if($ProgressBar.value <= 0):
		dead()

func dead():
	#Remover a nave inimiga do minimapa e da cena
	emit_signal("removed", self)
	queue_free()

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
