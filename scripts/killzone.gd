extends Area2D

#guarda el juego y cambia la escena ig
func _on_body_entered(_body: Node2D) -> void:
	Guardar._save()
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
