 extends MarginContainer
 
export (NodePath) var player
export var zoom = 1.5
 
onready var grid = $MarginContainer/Grid
onready var player_marker = $MarginContainer/Grid/PlayerMarker
onready var mob_marker = $MarginContainer/Grid/MobMarker
onready var alert_marker = $MarginContainer/Grid/AlertMarker

onready var icons = {"mob": mob_marker, "alert": alert_marker}

# transforma o tamanho do mundo no tamanho do mapa
var grid_scale

# todos os icones serão listados aqui
var markers = {}

func _ready():
	# pra deixar o jogador sempre no meio, pois pegamos o tamanho total do mapa, e posicionamos o player na metade dele
	player_marker.position = grid.rect_size / 2
	# O mapa vai ter o tamanho de 1.5% da viewport
	grid_scale = grid.rect_size / (get_viewport_rect().size * zoom)
	var map_objects = get_tree().get_nodes_in_group("minimap_objects")
	for item in map_objects:
		# Vamos duplicar o node existente que está oculto
		var new_marker = icons[item.minimap_icon].duplicate()
		# Vamos adicionar no minimapa um novo filho
		grid.add_child(new_marker)
		# vamos dar um "show" nele
		new_marker.show()
		# E adiciona-lo no array de todos os icones do minimapa
		markers[item] = new_marker
	
	
func _process(delta):
	if !player:
		return
	player_marker.rotation = get_node(player).rotation + PI / 108
	for item in markers:
		var obj_pos = (item.position - get_node(player).position) + grid_scale + grid.rect_size / 2
		markers[item].position = obj_pos
 
