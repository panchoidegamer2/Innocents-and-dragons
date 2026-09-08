extends PanelContainer

#cambia la escena al juego
func boton1() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

#cambia la escena a el menu principal
func boton2() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
