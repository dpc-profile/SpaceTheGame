extends KinematicBody2D

var cena_bala = preload("res://cenas/tiroTorre.tscn")
var mov = Vector2(0,0)
var velx = 60
var dentro_area = false

func _ready():
	get_tree().root.print_tree()

func _process(delta):
	mov.x = velx
	mov.y = 0
	var player = get_tree().root.get_node("Mapa/player2")
	if player:
		look_at(player.global_position)
	else:
		mov.x = 0
	mov = mov.rotated(rotation)
	#mov = move_and_slide(mov)


func _on_Timer_timeout():
	if dentro_area:
		disparar()


func _on_Area2D_body_entered(body):
	print("entrou")
	dentro_area = true

func _on_Area2D_body_exited(body):
	dentro_area  = false
	
func disparar():
	var bala = cena_bala.instance()
	bala.global_position = $bullet_point_enemy.global_position
	bala.rotation = rotation
	get_tree().root.add_child(bala)
