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
	#pone los puntos en 0 al inicio
	Global.puntos = 0
	Global.racha = 0
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#despausa el juego una vez haces el primer input
	if Input.is_action_just_pressed("volar") and get_tree().paused == true:
		get_tree().paused = false
		timer.start()
	#muestra los puntos y la racha en pantalla
	puntos.text = "Puntos: " + str(Global.puntos)
	racha.text = "Racha:" + str(Global.racha)

	#timer que genera las nubes
func _on_timer_timeout() -> void:
	#instancia la escena de nube, para crear varias
	var instance : Area2D = nube.instantiate()
	
	#genera una posicion random desde el array "spawns"
	instance.position = spawns.pick_random()
	
	#agarra el nodo de sprite de la nube instanciada para cambiarlo
	var diseño : AnimatedSprite2D = instance.get_node("AnimatedSprite2D")
	
	#array diseño cambia el color de las nubes, siendo normales o de tormenta
	diseño.animation = array_diseño.pick_random()
	
	#array nubes cambia el sprite, siendo mas grande o mas chiquitas
	diseño.frame = array_nubes.pick_random()
	
	#añade la nube instanciada como hijo
	add_child(instance)
#
