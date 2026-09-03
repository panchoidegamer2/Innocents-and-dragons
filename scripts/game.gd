extends Node2D

#precarga la escena de nube para tenerla siempre a mano
const nube = preload("res://scenes/nube.tscn")
#los puntos de spawn en un array 
var spawns: Array = [Vector2(500,200), Vector2(500,0), Vector2(500,-200)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var instance : Area2D = nube.instantiate()
	instance.position = spawns.pick_random()
	add_child(instance)
