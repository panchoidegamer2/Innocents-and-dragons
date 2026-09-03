extends Area2D

static var velocidad_nube:int = 500
@onready var jugador: CharacterBody2D = $"../jugador"
@onready var timer: Timer = $Timer
@onready var nube: AnimatedSprite2D = $AnimatedSprite2D
@onready var rayo_arriba: RayCast2D = $RayCast2D
@onready var rayo_abajo: RayCast2D = $RayCast2D2

# delta es el tiempo desde el anterior frame.
func _process(delta: float) -> void:
	#mueve a la nube por la velocidad dada multiplicado por delta
	position = position - Vector2(velocidad_nube * delta,0)
	if rayo_arriba.is_colliding() or rayo_abajo.is_colliding():
		Global.puntos += 1
		Global.racha += 1
		rayo_arriba.enabled = false
		rayo_abajo.enabled = false

func _on_body_entered(_body: Node2D) -> void:
	if nube.animation == "nube normal":
		#cuando un cuerpo entra en la nube baja la velocidad y empieza el timer
		velocidad_nube = 250
		Global.racha = 0
		rayo_arriba.enabled = false
		rayo_abajo.enabled = false
		timer.start()
	elif  nube.animation == "nube tormenta":
		jugador.puede_volar = false

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#cuando la nube sale de pantalla se elimina del arbol de nodos
	queue_free()


func _on_timer_timeout() -> void:
	#termina el timer y vuelve la velocidad
	velocidad_nube = 500
	timer.stop()
