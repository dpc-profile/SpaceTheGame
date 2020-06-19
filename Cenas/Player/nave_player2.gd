extends KinematicBody2D

export var bullet_speed = 200 #original 200
export var fire_rate = 0.4 #velocidade da cadencia de tiro
export var thrust = 400   #força de impulso das turbunas da nave
export var friction = 0.65  #original 0.65, o atrito da nave??(atrito no espaço??)

var vel = Vector2() #velocidade
var acc = Vector2() #aceleração
var gem = "live"

var gem_body = preload("res://Cenas/Gem/gem_body.tscn")
var gem_droped
 
#define o time do personagem
var team = 1

var bullet_cena = preload("res://Cenas/Player/player_bullet.tscn")
var can_fire = true
var direcao = Vector2()

func _ready():
	$GUI/NickName.text = pega_Nome.player_Nome #Coloca o Nickname no Player
	add_to_group("player1")
	$gem_target.visible = false

func _physics_process(delta):
	_olhe_para_mouse()
	_mova_para_mouse(delta)
	Global.player_global_pos = global_position
	if Input.is_action_pressed("mouse_left") and can_fire:
		shoot()

func _process(delta):	
	if Global.vitoria == true:
		vitoria()
		
	#Renan: Oculta ou mostra a gema ao lado da barra de vida
	var gem_target = Global.collected
	if(gem_target==true and Global.pickable_gem):
		$gem_target.visible = true
	else:
		$gem_target.visible = false
	
	

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
		game_over()


func game_over():
	redefinir()
	get_tree().change_scene("res://Cenas/Cena_derrota/Game_over.tscn")
	
func vitoria():
	redefinir()
	get_tree().change_scene("res://Cenas/Cena_vitoria/vitoria.tscn")	

	
func redefinir():
	#Redefine a posição e os status da gema
	var body = gem_body.instance()
	body.global_position = Vector2(767, 35)
	get_tree().root.add_child(body)
	#Oculta as indicações da bandeira
	gem_droped = false
	Global.status = gem
	Global.collected_gem(gem_droped)
	Global.ellegible_pickable(false)
	Global.vitoria = false
