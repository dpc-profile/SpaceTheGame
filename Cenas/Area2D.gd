extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var torretiro = preload(res://Cenas/Torret fire.tscn)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var nomebody = body.get_name()
	#Checa o nome do corpo
	if "player" in nomebody:
		var torretiro_instance = tiro.instance()
		torretiro_instance.position = get_global_position()
		torretiro_instance.rotation = get_angle_to(get_global_player_position())
		get_parent().add_child(torretiro_instance)
