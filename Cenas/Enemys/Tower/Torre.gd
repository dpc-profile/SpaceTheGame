extends KinematicBody2D

var cena_bala = preload("res://Cenas/Enemys/Tower/tiroTorre.tscn")
var mov = Vector2(0,0)
var velx = 60
var dentro_area = false

var hp = 60
var disable = false

var minimap_icon="mob"

func _process(delta):
	if Global.player_global_pos != null and !disable:
		look_at(Global.player_global_pos)

func _on_Timer_timeout():
	if dentro_area:
		disparar()

func _on_Area2D_body_entered(body):
	if body.is_in_group("player1") and !disable:
		dentro_area = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("player1"):
		dentro_area  = false
	
func disparar():
	var bala = cena_bala.instance()
	bala.global_position = $bullet_point_enemy.global_position
	bala.rotation = rotation
	get_tree().root.add_child(bala)

func recebendo_dano(damage):
	if !disable:
		hp -= damage
		if hp <= 0:
			tower_disable()
			yield(get_tree().create_timer(4),"timeout")#Um timer de 4 segundos
			tower_enable()
		
func tower_disable():
	$Sprite.self_modulate = Color.gray
	dentro_area = false
	disable = true

func tower_enable():
	$Sprite.self_modulate = Color(1,1,1,1)
	dentro_area = true
	disable = false
	hp = 60
