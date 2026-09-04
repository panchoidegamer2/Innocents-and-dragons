extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Guardar._save()
	get_tree().free()
