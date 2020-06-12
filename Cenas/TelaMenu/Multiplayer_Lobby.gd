extends Control


func _process(delta):
<<<<<<< HEAD
	$"HBoxContainer/Time 1/Label1".text = Network.players[0].name + " (Host)"
=======
	$"HBoxContainer/Time 1/Label1".text = Network.players[0].name
	
>>>>>>> Update Multiplayer


func _on_RefreshPlayers_timeout():
	for i in Network.players:
		print(Network.players[i])
<<<<<<< HEAD
		$RichTextLabel.text = Network.players[i].name


func _on_ComecarPartida_pressed():
	get_tree().change_scene("res://Cenas/Mapa_Captura_Bandeira.tscn")


func _on_Sair_pressed():
	get_tree().change_scene('res://Cenas/TelaMenu/TitleScream.tscn')
	Network.MULTIPLAYER_ON = false
=======
		$RichTextLabel.text =" " +Network.players[i].name
>>>>>>> Update Multiplayer
