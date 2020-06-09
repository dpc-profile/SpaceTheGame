extends Area2D

export var dano = 20
#Alterando o primeiro valor do Vector2, aumenta ou diminui a velocidade da bala
func _process(delta):
	translate(Vector2(10,0))

#Ao tiro acertar um body, envia a informação de dano pra ele
func bala_torre_acerta_body(body):
	if body.is_in_group("player1"):
		body.recebendo_dano(dano)
		queue_free()

#Se a bala não acertar, depois de 2 segundo ela some
func _on_Timer_timeout():
	queue_free()
