extends VBoxContainer

func boton1() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func boton3() -> void:
	get_tree().quit()
