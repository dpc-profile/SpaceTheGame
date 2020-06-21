extends RigidBody2D

export var bullet_speed = 1000
export var damage = 20
var delay = 3
func _process(delta):
	if($Timer.wait_time > 0.1):
		$blue.emitting =  true


func _on_player_bullet_body_entered(body):
	$Sprite.hide()
	$Light2D.enabled = false
	$bullet_explosion/color_animation.play("player_bullet")
	$bullet_explosion/explosion_animation.play("explode")
	
	if (body is KinematicBody2D):
		body.recebendo_dano(damage)
		delay = 0.4
	yield(get_tree().create_timer(delay),"timeout")
	queue_free()

func _on_Timer_timeout():
	queue_free()
