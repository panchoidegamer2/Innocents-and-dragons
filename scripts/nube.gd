extends Area2D

@onready var jugador: CharacterBody2D = $"../jugador"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(jugador)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(_body: Node2D) -> void:
	jugador.puede_volar = false
	print("adios")
