extends KinematicBody2D

export var bullet_speed = 200
export var fire_rate = 0.4 #velocidade da cadencia de tiro
export var thrust = 400   #força de impulso das turbunas da nave
export var friction = 0.65  #o atrito da nave??(atrito no espaço?? REALY?????)
export var max_move_speed = 600
export var min_move_speed = 300
export var stop_distance = 20


var pos = Vector2() #posição
var vel = Vector2() #velocidade
var acc = Vector2() #aceleração

var bullet_cena = preload("res://Cenas/player_bullet.tscn")
var can_fire = true
var direcao = Vector2()

func _process(delta):
	_olhe_para_mouse()
	_mova_para_mouse()
	if Input.is_action_pressed("mouse_left") and can_fire:
		shoot()

func _olhe_para_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _mova_para_mouse():
	if Input.is_action_pressed("mouse_right"):
		var direcao = get_global_mouse_position() - position 
		var normalized_direction = direcao.normalized()
		var direction_distance = direcao.length()
		
		move_and_slide(normalized_direction * max(min_move_speed, min(max_move_speed, direction_distance)))

func shoot():
	var bullet = bullet_cena.instance()
	var direcao = $BulletPoint/Position2D.position
	bullet.global_position = $BulletPoint.global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.rotate(80)
	bullet.apply_impulse(Vector2(), Vector2(direcao*bullet_speed).rotated(rotation))
	get_tree().root.add_child(bullet)
	
	
	
	can_fire = false
	yield(get_tree().create_timer(fire_rate),"timeout")
	can_fire = true
