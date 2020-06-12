extends KinematicBody2D

const MAX_HP = 100

#class_name Player
#signal removed
export var bullet_speed = 200 #original 200
export var fire_rate = 0.4 #velocidade da cadencia de tiro
export var thrust = 400   #força de impulso das turbunas da nave
export var friction = 0.65  #original 0.65, o atrito da nave??(atrito no espaço?? REALY?????)
#var minimap_icon="player"

var health_points = MAX_HP
var vel = Vector2() #velocidade
var acc = Vector2() #aceleração

#Gema
var ghost_gem = preload("res://Cenas/ghost_gem.tscn") 
var gem_droped 

var bullet_cena = preload("res://Cenas/player_bullet.tscn")
var can_fire = true
var direcao = Vector2()
var grupo = ""

func _ready():
	grupo = "player1"
	_update_hp()
	$GUI/NickName.text = get_node("/root/pega_Nome").player_Nome
	add_to_group(grupo)
	$gem_target.visible = false #Renan: função para setar a gema como invisivel

func _physics_process(delta):
	_olhe_para_mouse()
	_mova_para_mouse(delta)
	if Input.is_action_pressed("mouse_left") and can_fire:
		shoot()
	
func _process(delta):
	Global.player_global_pos = global_position
	#Renan: Solta a Gema, trocar pela morte depois
	if Input.is_action_just_pressed("ui_z"):
		morte_falsa()
	#Renan: Oculta ou mostra a gema ao lado da barra de vida
#	var gem_target = $"/root/global".collected
#	if(gem_target==true):
#		$gem_target.visible = true
#	else:
#		$gem_target.visible = false
	
	if get_tree().is_network_server():
		Network.update_position(int(name), position)
		
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

func _update_hp():
	$ProgressBar.value = health_points
	
#remova o return para quando o hp do player zerar dar game_over
func recebendo_dano(dano):
	health_points -= dano
	if $CollisionShape2D.disabled == false and health_points <= 0:
		health_points = 0
		game_over()
	_update_hp()
	
func game_over():
	if Network.MULTIPLAYER_ON:
		rpc('_die')
		_die()
	else:
		get_tree().change_scene("res://Cenas/Game_over.tscn")

sync func _die():
	$RespawnTimer.start()
	set_physics_process(false)
	for child in get_children():
		if child.has_method('hide'):
			child.hide()
	$CollisionShape2D.disabled = true
	remove_from_group(grupo)

func _on_RespawnTimer_timeout():
	set_physics_process(true)
	for child in get_children():
		if child.has_method('show'):
			child.show()
	$CollisionShape2D.disabled = false
	health_points = MAX_HP
	_update_hp()
	add_to_group(grupo)

func init(nickname, start_position, is_slave):
	#$GUI/Nickname.text = nickname
	global_position = start_position
	if is_slave:
		print("yeet")
		
func morte_falsa():
	#instancia a gema com base na posição atual do player
		var gem = ghost_gem.instance()
		#gem.global_position = $ghost_gem.global_position
		get_tree().root.add_child(gem)
		#Oculta as indicações da bandeira
		gem_droped = false
		$"/root/global".collected_gem(gem_droped)
