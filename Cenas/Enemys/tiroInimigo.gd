extends Area2D
export var dano = 20


func _process(delta):
	translate(Vector2(10,0))

#Ao tiro acertar um body, envia a informação de dano pra ele
func _on_bala_acerta_body_entered(body):
	$Sprite.hide()
	$bullet_explosion/color_animation.play("player_bullet")
	$bullet_explosion/explosion_animation.play("explode")
	if body.is_in_group("player1"):
		body.recebendo_dano(dano)
	yield(get_tree().create_timer(0.5),"timeout")
	queue_free()

#Se a bala não acertar, depois de 2 segundo ela some
func _on_Timer_timeout():
	queue_free()
