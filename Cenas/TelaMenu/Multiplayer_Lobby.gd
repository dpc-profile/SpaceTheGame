extends Control


func _process(delta):
	$"HBoxContainer/Time 1/Label1".text = Network.players[0].name
	


func _on_RefreshPlayers_timeout():
	for i in Network.players:
		print(Network.players[i])
		$RichTextLabel.text =" " +Network.players[i].name
