extends Node2D

#precarga la escena de nube para tenerla siempre a mano
const nube = preload("res://scenes/nube.tscn")

#arrays para el punto de spawn, el diseño y tipo de nube
var spawns: Array = [Vector2(850,200), Vector2(850,0), Vector2(850,-200)]
var array_nubes: Array = [0,1,2,3,4,5,6,7,8]
var array_diseño: Array =  ["nube normal","nube normal","nube normal","nube tormenta"]

#timer para las nubes
@onready var timer: Timer = $Timer
@onready var puntos: Label = $PanelContainer/VBoxContainer/puntos
@onready var racha: Label = $PanelContainer/VBoxContainer/racha

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("volar") and get_tree().paused == true:
		get_tree().paused = false
		timer.start()
	puntos.text = "Puntos: " + str(Global.puntos)
	racha.text = "Racha:" + str(Global.racha)

func _on_timer_timeout() -> void:
	var instance : Area2D = nube.instantiate()
	instance.position = spawns.pick_random()
	var diseño : AnimatedSprite2D = instance.get_node("AnimatedSprite2D")
	diseño.animation = array_diseño.pick_random()
	diseño.frame = array_nubes.pick_random()
	add_child(instance)
#
