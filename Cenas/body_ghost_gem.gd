extends KinematicBody2D

export var thrust = 400   
export var friction = 0.65 


var delta
var vel = Vector2() #velocidade
var acc = Vector2() #aceleração


#se move caso o player morra
func _process(delta):
	#return #impede que o codigo rode e quebre o jogo
	
	#if(Input.is_action_just_pressed("espaco")):
		#Renan: instaciar uma cena dentro de outra cena
		#get_tree().get_node("res://Cenas/gem_body.tscn").add_child("res://Cenas/ghost_gem.tscn")
	#mata o corpo da gema
	if Global.status == "die":
		queue_free()
func look_to_home(delta):
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90
func return_to_home():
	if Input.is_action_pressed("mouse_right"):
		acc = Vector2(thrust, 0).rotated(rotation+80.1)
	else:
		acc = Vector2(0,0)
	acc += vel * -friction
	vel += acc * delta
	move_and_slide(vel)

