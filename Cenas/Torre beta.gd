extends Node2D

onready var player = get_parent().get_node("player2")

var player_position
var angulo
var bullet_speed = 5
var can_fire = true
var bullet_cena = preload("res://Cenas/Torret fire.tscn")
var fire_rate = 0.4
# Called when the node enters the scene tree for the first time.
func _ready():
	print("este torre")
	pass # Replace with function body.


func _on_Detec_body_shape_entered(body_id, body, body_shape, area_shape):
	var nomebody = body.get_name()
	#Checa o nome do corpo
	if "player2" == nomebody:
		player_position = player.get_global_position()
		var bullet = bullet_cena.instance()
		var direcao = $BulletPoint.position
		var direcao2 = get_parent().get_node("player2").get_transform()
		direcao2 = direcao2[2]
		angulo = (get_angle_to(player_position)/3.14*180)
		get_node("BulletPoint").rotation_degrees = (angulo)
		print(angulo)
		print(get_node("BulletPoint").rotation_degrees)
		
		bullet.global_position = $BulletPoint/Bullet.global_position
		
		bullet.rotation = get_angle_to(player_position)
		bullet.apply_impulse(Vector2(), Vector2(direcao2*bullet_speed))
		get_tree().root.add_child(bullet)
	
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true

func recebendo_dano(damage):
	#quando a torre recebe dano
	pass
