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
var gem = "live"

#instanciando Gema(bandeira)
var gem_body = preload("res://Cenas/Gem/gem_body.tscn")
var gem_droped
 
#define o time do personagem
var team = 1

#pepara os tiros
var bullet_cena = preload("res://Cenas/Player/player_bullet.tscn")
var can_fire = true
var direcao = Vector2()

#Renan: função para setar a gema como invisivel
func _ready():
	add_to_group("player1")
	$gem_target.visible = false
	
func _process(delta):
	_olhe_para_mouse()
	_mova_para_mouse(delta)
	Global.player_global_pos = global_position
	
	if Global.vitoria == true:
		vitoria()
		
	if Input.is_action_pressed("mouse_left") and can_fire:
		shoot()
	#Renan: Solta a Gema, trocar pela morte depois
	if Input.is_action_just_pressed("ui_z"):
		morte_falsa()
	#Renan: Oculta ou mostra a gema ao lado da barra de vida
	var gem_target = Global.collected
	if(gem_target==true and Global.pickable_gem):
		$gem_target.visible = true
	else:
		$gem_target.visible = false

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


func recebendo_dano(dano):
	$ProgressBar.value -= dano
	if $ProgressBar.value <= 0:
		return
		game_over()
		
		
func game_over():
	morte_falsa()
	get_tree().change_scene("res://Cenas/Game_over.tscn")
	
func vitoria():
	morte_falsa()
	get_tree().change_scene("res://Cenas/Cena_vitoria/vitoria.tscn")	

	
func morte_falsa():
	#instancia a gema com base na posição atual do player
		var body = gem_body.instance()
		body.global_position = Vector2(767, 35)
		get_tree().root.add_child(body)
		#Oculta as indicações da bandeira
		gem_droped = false
		Global.status = gem
		Global.collected_gem(gem_droped)
		Global.ellegible_pickable(false)
		Global.vitoria = false
