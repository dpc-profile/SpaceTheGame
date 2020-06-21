extends KinematicBody2D

signal removed
var cena_bala = preload("res://Cenas/Enemys/tiroInimigo.tscn")
var speed = 100
var mov = Vector2(0,0)
var minimap_icon = "mob"
var na_area = false

func _ready():
	$smoke_particle.emitting = false
	$technical_problem.emitting = false
	$technical_problem2.emitting = false
	
func _physics_process(delta):
	mov.x = speed
	if Global.player_global_pos != null:
		look_at(Global.player_global_pos)
	rotation_degrees = rotation_degrees + 90
	mov = mov.rotated(rotation-45)
	mov = move_and_slide(mov)

func recebendo_dano(damage):
	$hurt.play()
	$ProgressBar.value -= damage
	if $ProgressBar.value <= 50:
		$smoke_particle.emitting = true
		#chama smoke
	if $ProgressBar.value <= 25:
		$technical_problem.emitting = true
		$technical_problem2.emitting = true
	if($ProgressBar.value <= 0):
		dead()

func dead():
	dead_animation()
	$LightOccluder2D.visible = false
	yield(get_tree().create_timer(0.5),"timeout")
	Global.shake_screen = true
	#Remover a nave inimiga do minimapa e da cena
	yield(get_tree().create_timer(1.7),"timeout")
	emit_signal("removed", self)
	queue_free()
	
func dead_animation():
	set_physics_process(false)
	na_area = false
	$explosion/AnimationPlayer.play("explosion")
	
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
	$tiro.play()
	var bala = cena_bala.instance()
	bala.global_position = $BulletPointEnemy.global_position
	bala.rotation = rotation + 4.8
	get_tree().root.add_child(bala)
