extends Node2D

func _ready():
	#conecta o sinal de removed emitido pelos mobs/gema com o minimap
	for object in get_tree().get_nodes_in_group("minimap_objects"):
		object.connect("removed", $CanvasLayer/MiniMap, "_on_object_removed")
