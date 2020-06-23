extends Area2D
export var dano = 15

func _process(delta):
	translate(Vector2(10,0))

#Ao tiro acertar um body, envia a informação de dano pra ele
func bala_torre_acerta_body(body):
	if body.is_in_group("player1"):
		$Sprite.hide()
		#ativação das particulas
		$bullet_explosion/color_animation.play("enemy_bullet")
		$bullet_explosion/explosion_animation.play("explode")
		body.recebendo_dano(dano)
		#define delay de tempo para animação aparecer
		yield(get_tree().create_timer(2),"timeout")
		queue_free()

#Se a bala não acertar, depois de 2 segundo ela some
func _on_Timer_timeout():
	queue_free()
