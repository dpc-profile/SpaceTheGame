extends Control
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

var conexao = [Network.DEFAULT_IP, Network.DEFAULT_PORT]

var lineEdit = ""

func _ready():
	if Network.MULTIPLAYER_ON:
		$VBoxContainer/HBoxContainer2/CriarServer.show()
		$OpcoesConexao.show()
		$IP_Porta.hide()
		$VBoxContainer/HBoxContainer2/Comecar.text = "Entrar no Server"
	else:
		$VBoxContainer/HBoxContainer2/CriarServer.hide()
		$OpcoesConexao.hide()
		$IP_Porta.hide()
		$VBoxContainer/HBoxContainer2/Comecar.text = "Começar"
		
		
func _on_LineEdit_text_changed(new_text):
	lineEdit = new_text


func _on_Comecar_pressed():
	if lineEdit == "":#não deixa o player entrar sem um nome
		return
	get_node("/root/menu_musica/AudioStreamPlayer").stop()#Para a MusicaDoMenu
	
	if Network.MULTIPLAYER_ON: 
		if conexao[0] != Network.DEFAULT_IP and conexao[0] != '': #Confere se o IP de conexao foi alterado
			Network.conexao[0] = conexao[0]
		Network.connect_to_server(lineEdit)
	else:
		pega_Nome.player_Nome = lineEdit #Pega o que foi escrito no lineedit e setta ele no script global pega_Nome.gd
	_load_game()
	
func _on_CriarServer_pressed():
	if lineEdit == "":
		return
	if conexao[1] != Network.DEFAULT_PORT and conexao[1] != 0: #Confere se a Porta de conexao foi alterado
		Network.conexao[1] = conexao[1]
	Network.create_server(lineEdit)
	_load_game()

func _load_game():
	get_tree().change_scene("res://Cenas/TelaMenu/Multiplayer_Lobby.tscn")
	#get_tree().change_scene("res://Cenas/Mapa_Captura_Bandeira.tscn")


func _on_IP_text_changed(new_text):
	conexao[0] = str(new_text)

func _on_Porta_text_changed(new_text):
	conexao[1] = int(new_text)

func _on_OpcoesConexao_toggled(button_pressed):
	if $OpcoesConexao.pressed:
		$IP_Porta.show()
	else:
		$IP_Porta.hide()
