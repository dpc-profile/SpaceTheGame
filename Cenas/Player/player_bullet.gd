extends RigidBody2D

export var bullet_speed = 1000
export var damage = 20
var explosion = preload("res://Cenas/Efeitos/Explosion.tscn")
var spark = preload("res://Cenas/Efeitos/bullet_particle.tscn")


func _process(delta):
	if($Timer.wait_time > 0.1):
		$blue.emitting =  true


func _on_player_bullet_body_entered(body):
	var explosion_instance = explosion.instance()
	explosion_instance.position = get_global_position()
	get_tree().get_root().add_child(explosion_instance)
	queue_free()
	if (body is KinematicBody2D):
		body.recebendo_dano(damage)
		
func _on_Timer_timeout():
	queue_free()
