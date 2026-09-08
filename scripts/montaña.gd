extends Sprite2D


# mueve la montaña
func _process(_delta: float) -> void:
	position = position - Vector2(3,0)

#ni bien la montaña desaparece de pantalla la borra del tree, asi no ocupa espacio 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
