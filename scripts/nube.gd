extends Area2D

@onready var jugador: CharacterBody2D = $"../jugador"
@export var velocidad_nube:int
# var padre = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# delta es el tiempo desde el anterior frame.
func _process(delta: float) -> void:
	#mueve a la nube por la velocidad dada multiplicado por delta
	position = position - Vector2(velocidad_nube * delta,0)

func _on_body_entered(_body: Node2D) -> void:
	jugador.puede_volar = false
	print("adios")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
