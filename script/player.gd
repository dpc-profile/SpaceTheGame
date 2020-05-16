extends KinematicBody2D
#player movimentação wasd
export var rot_speed = 2.5   #velocidade de rotação da nave
export var thrust = 500   #força de impulso das turbunas da nave
export var max_vel = 400   #velocidade maxima
export var friction = 0.65  #o atrito da nave??(atrito no espaço?? REALY?????)
export var bullet_speed = 1000
export var fire_rate = 0.4 #velocidade da cadencia de tiro

var bullet = preload("res://Cenas/player_bullet.tscn")

var can_fire = true
var screen_size = Vector2() #tamanho da tela
var rot = 0 #rotação
var pos = Vector2() #posição
var vel = Vector2() #velocidade
var acc = Vector2() #aceleração

func _ready():
	screen_size = get_viewport_rect().size #pega a area da tela em tempo real
	#position  = screen_size #centraliza o player na tela
	
func _process(delta):
	
	if Input.is_action_pressed("player_shoot") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true
		
func _physics_process(delta):
	rot = 0
	if Input.is_action_pressed("player_left"):
		rot -= rot_speed
	if Input.is_action_pressed("player_right"):
		rot += rot_speed
	if Input.is_action_pressed("player_thrust"):
		acc = Vector2(thrust, 0).rotated(rotation)
	else:
		acc = Vector2(0,0)
	if Input.is_action_pressed("player_stop"):
		acc += -vel 
	
	acc += vel * -friction
	vel += acc * delta
	rotation += rot_speed * rot * delta
	#position += vel * delta
	move_and_slide(vel)
