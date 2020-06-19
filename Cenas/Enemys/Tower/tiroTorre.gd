extends Area2D
export var dano = 20

var explosion = preload("res://Cenas/Efeitos/Explosion.tscn")

func _process(delta):
	translate(Vector2(10,0))

#Ao tiro acertar um body, envia a informação de dano pra ele
func bala_torre_acerta_body(body):
	if body.is_in_group("player1"):
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		body.recebendo_dano(dano)
		queue_free()

#Se a bala não acertar, depois de 2 segundo ela some
func _on_Timer_timeout():
	queue_free()
