extends KinematicBody2D


#class_name Player
#signal removed
export var bullet_speed = 200 #original 200
export var fire_rate = 0.4 #velocidade da cadencia de tiro
export var thrust = 400   #força de impulso das turbunas da nave
export var friction = 0.65  #original 0.65, o atrito da nave??(atrito no espaço?? REALY?????)
#var minimap_icon="player"

var vel = Vector2() #velocidade
var acc = Vector2() #aceleração

#Gema
var ghost_gem = preload("res://Cenas/ghost_gem.tscn") 
var gem_droped 

var bullet_cena = preload("res://Cenas/player_bullet.tscn")
var can_fire = true
var direcao = Vector2()

#Renan: função para setar a gema como invisivel
func _ready():
	$gem_target.visible = false
	
func _process(delta):
	_olhe_para_mouse()
	_mova_para_mouse(delta)
	if Input.is_action_pressed("mouse_left") and can_fire:
		shoot()
	#Renan: Solta a Gema, trocar pela morte depois
	if Input.is_action_just_pressed("ui_z"):
		morte_falsa()
	#Renan: Oculta ou mostra a gema ao lado da barra de vida
#	var gem_target = $"/root/global".collected
#	if(gem_target==true):
#		$gem_target.visible = true
#	else:
#		$gem_target.visible = false

#Coloca o Nickname no Player
	$GUI/NickName.text = get_node("/root/pega_Nome").player_Nome
		
func _olhe_para_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _mova_para_mouse(delta):
	if Input.is_action_pressed("mouse_right"):
		acc = Vector2(thrust, 0).rotated(rotation+80.1)
	else:
		acc = Vector2(0,0)
	acc += vel * -friction
	vel += acc * delta
	move_and_slide(vel)
	
func shoot():
	var bullet = bullet_cena.instance()
	var direcao = $BulletPoint/Position2D.position
	bullet.global_position = $BulletPoint.global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.rotate(80.1)
	
	bullet.apply_impulse(Vector2(), Vector2(direcao*bullet_speed).rotated(rotation))
	get_tree().root.add_child(bullet)
	
	can_fire = false
	yield(get_tree().create_timer(fire_rate),"timeout")
	can_fire = true

func recebendo_dano():
	$ProgressBar.value -= 20

func morte_falsa():
	#instancia a gema com base na posição atual do player
		var gem = ghost_gem.instance()
		#gem.global_position = $ghost_gem.global_position
		get_tree().root.add_child(gem)
		#Oculta as indicações da bandeira
		gem_droped = false
		$"/root/global".collected_gem(gem_droped)
		
		
