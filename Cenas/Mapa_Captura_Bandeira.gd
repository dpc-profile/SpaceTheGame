extends Node2D

const spawn_up := Vector2(768, 48) 
const spawn_down := Vector2(768, 2000)

#Caminho dessa cena vinculada por codigo em Network.gb
func _ready():
		
	if Network.MULTIPLAYER_ON:
		#Quando o multiplayer é ativo ele mata os Mobs
		$Mob.queue_free()
		$Mob2.queue_free()
		get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
		get_tree().connect('server_disconnected', self, '_on_server_disconnected')
		
		var new_player = preload('res://Cenas/nave_player2.tscn').instance()
		new_player.name = str(get_tree().get_network_unique_id())
		new_player.set_network_master(get_tree().get_network_unique_id())
		add_child(new_player)
		var info = Network.self_data
		info.position = spawn_down
		new_player.init(info.name, info.position, false)
	else:
		var new_player = preload('res://Cenas/nave_player2.tscn').instance()
		add_child(new_player)
		new_player.global_position = $down_side_spawn/Position2D.global_position
		
func _on_player_disconnected(id):
	get_node(str(id)).queue_free()

func _on_server_disconnected():
	get_tree().change_scene('res://Cenas/TelaMenu/TitleScream.tscn')
