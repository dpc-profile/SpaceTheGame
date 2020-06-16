extends Control



#variaveis 

var res_largura = 1024
var res_altura = 600
var fullscreen = false


func _ready():
	
	resolucao()
	pass	



func resolucao():	
# pega as configurações da tela (Largura e Altura) e coloca nas variaveis
# res_largura e res_altura

	ProjectSettings.set_setting("display/window/size/width",res_largura)
	ProjectSettings.set_setting("display/window/size/height",res_altura)
	OS.set_window_size(Vector2(res_largura, res_altura))
	
	if(fullscreen == true):
		
		OS.set_window_fullscreen(true)
	elif(fullscreen == false):
		
		OS.set_window_fullscreen(false)	
		OS.set_window_position(Vector2(0,0))
		
		
	pass





