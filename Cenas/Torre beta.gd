extends Node2D

var bullet_speed = 2
var can_fire = true
var bullet_cena = preload("res://Cenas/Torret fire.tscn")
var fire_rate = 0.4
# Called when the node enters the scene tree for the first time.
func _ready():
	print("este torre")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Detec_body_shape_entered(body_id, body, body_shape, area_shape):
	var nomebody = body.get_name()
	#Checa o nome do corpo
	if "player2" == nomebody:
		var bullet = bullet_cena.instance()
		var direcao = get_parent().get_node("player2").get_transform()
		direcao = direcao[2]
		print(direcao)
		
		bullet.global_position = $BulletPoint.global_position
		bullet.rotation_degrees = rotation_degrees
		bullet.rotate(80)
		bullet.apply_impulse(Vector2(), Vector2(direcao*bullet_speed).rotated(rotation))
		get_tree().root.add_child(bullet)
	
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true
