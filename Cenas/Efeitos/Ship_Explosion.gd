extends Node2D

func _ready():
	$AudioStreamPlayer.play()
	$Explosion2.hide()
	$Explosion3.hide()
	$Explosion4.hide()

func _on_Explosion1_animation_finished():
	$AudioStreamPlayer.play()
	$Explosion2.show()
	$Explosion2.play()

func _on_Explosion2_animation_finished():
	$AudioStreamPlayer.play()
	$Explosion3.show()
	$Explosion3.play()
	
func _on_Explosion3_animation_finished():
	$AudioStreamPlayer.play()
	$Explosion4.show()
	$Explosion4.play()

func _on_Explosion4_animation_finished():
	$Explosion1.stop()
	$Explosion1.hide()
	$Explosion2.stop()
	$Explosion2.hide()
	$Explosion3.stop()
	$Explosion3.hide()
	$Explosion4.stop()
	$Explosion4.hide()
	yield(get_tree().create_timer(0.9),"timeout")
	queue_free()
	
