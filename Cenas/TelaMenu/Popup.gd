extends Popup

var tuto1 = preload("res://imagens/tutos/Tuto1.1.png")
var tuto2 = preload("res://imagens/tutos/Tuto2.1.png")
var tuto3 = preload("res://imagens/tutos/Tuto3.png")
var tuto4 = preload("res://imagens/tutos/Tuto4.png")
var tuto5 = preload("res://imagens/tutos/Tuto5.png")
var tuto6 = preload("res://imagens/tutos/Tuto6.1.png")
var slide = 1

onready var tuto_sprite = get_node("Tuto/imagem")

func _on_ToolButton_pressed():
	popup()

func _on_Tuto_pressed():
	if slide == 1:
		tuto_sprite.set_texture(tuto2)
		slide = slide + 1
	elif	slide == 2:
		tuto_sprite.set_texture(tuto3)
		slide = slide + 1
	elif	slide == 3:
		tuto_sprite.set_texture(tuto4)
		slide = slide + 1
	elif	slide == 4:
		tuto_sprite.set_texture(tuto5)
		slide = slide + 1
	elif	slide == 5:
		tuto_sprite.set_texture(tuto6)
		slide = slide + 1
	elif slide == 6:
		tuto_sprite.set_texture(tuto1)
		slide = 1
