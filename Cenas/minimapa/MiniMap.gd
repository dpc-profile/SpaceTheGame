extends MarginContainer

export (NodePath) var player  #Linka com o player
export var zoom = 1.5 setget set_zoom 


onready var grid = $MarginContainer/Grid
onready var player_marker = $MarginContainer/Grid/PlayerMarker
onready var mob_marker = $MarginContainer/Grid/MobMarker
onready var alert_marker = $MarginContainer/Grid/AlertMarker
#Liga os objetos com as marcação, se guiando por "icons" 
onready var icons = {"mob": mob_marker, "alert": alert_marker}

var grid_scale
var markers = {} 


func _ready():
	#Mesmo se o NodePath não tiver vinculado com o player,
	#essa linha faz o minimapa enxergar o player
	player = '../../player2'
	
	#Sentraliza a marcação do player
	player_marker.position = grid.rect_size / 2
	#Ajusta a escala dos marcadores
	grid_scale = grid.rect_size / (get_viewport_rect().size * zoom)
	#Marca todos os objetos
	var map_objects = get_tree().get_nodes_in_group("minimap_objects")
	for item in map_objects:
		var new_marker = icons[item.minimap_icon].duplicate()
		grid.add_child(new_marker)
		new_marker.show()
		markers[item] = new_marker

func _process(delta):
	if !player:
		return
	#Sincroniza a seta com o player
	player_marker.rotation = get_node(player).rotation + PI/108
	for item in markers:
		var obj_pos = (item.position - get_node(player).position) * grid_scale + grid.rect_size / 2
		#Ajusta as marcações para ficarem dentro do minimapa
		if grid.get_rect().has_point(obj_pos + grid.rect_position):
			markers[item].scale = Vector2(1, 1)
		else:
			markers[item].scale = Vector2(0.75, 0.75)
		obj_pos.x = clamp(obj_pos.x, 0, grid.rect_size.x)
		obj_pos.y = clamp(obj_pos.y, 0, grid.rect_size.y)
		markers[item].position = obj_pos
		
	
	
func _on_object_removed(object):
	#Remove do minimapa os objetos, quando um objeto emite o sinal "removed"
	if object in markers:
		markers[object].queue_free()
		markers.erase(object)


func set_zoom(value):
	#Ajusta o zoom e recalcula a escala
	zoom = clamp(value, 0.5, 5)
	grid_scale = grid.rect_size / (get_viewport_rect().size * zoom)
	
	
func _on_MiniMap_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_WHEEL_UP:
			self.zoom += 0.1
		if event.button_index == BUTTON_WHEEL_DOWN:
			self.zoom -= 0.1


