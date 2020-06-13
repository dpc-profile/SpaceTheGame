extends Control

#variaveis temporarias
const SAVE_PATH = "res://save.json"
var settings = {}

#variaveis salvas




var res_width = 1920
var res_height = 1080
var fullscreen = false


func _ready():
	load_game()
	#save_game()
	resolution()
	pass	



func resolution():
# pega as configurações da tela (Largura e Altura) e coloca nas variaveis
# res_width e res_height

	ProjectSettings.set_setting("display/window/size/width",res_width)
	ProjectSettings.set_setting("display/window/size/height",res_height)
	OS.set_window_size(Vector2(res_width, res_height))
	
	if(fullscreen == true):
		OS.set_window_fullscreen(false)
		OS.set_window_fullscreen(true)
	elif(fullscreen == false):
		OS.set_window_fullscreen(true)
		OS.set_window_fullscreen(false)	
		OS.set_window_position(Vector2(0,0))
		
		
	pass

func save_game():
	var settings = {
		resolution = {
			width = res_width,
			height = res_height
			
		},
		fullscreen = fullscreen
		
	}
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(to_json(settings))
	save_file.close()
		
	pass

func load_game():
	var save_file = File.new()
	if(not save_file.file_exists(SAVE_PATH)):
		return
		
	save_file.open(SAVE_PATH, File.READ)
	
	var data = {} 
	data = parse_json(save_file.get_as_text())	
	
	res_width = data['resolution']['width']
	res_height = data['resolution']['height']
	fullscreen = data['fullscreen']
	
	pass	



