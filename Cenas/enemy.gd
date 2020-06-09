extends KinematicBody2D
export var life_player = 100
var morreu = false 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	# life_player = get_tree().root.get_node("GUI").get_node("life_player").get_property("value")
	pass
	
func recebendo_dano(damage):
	$ProgressBar.value -= damage
	#chama a tela de GAME OVER
	if($ProgressBar.value == 0):
		get_tree().change_scene("res://Cenas/Game_over.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
