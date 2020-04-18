extends RigidBody2D
var explosion = preload("res://Cenas/Explosion.tscn")

func _on_player_bullet_body_entered(body):
	if !body.is_in_group("player1"):
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		queue_free()
