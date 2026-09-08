extends Area2D

#las variables static son para todas las instancias, si cambia en una cambia en todas
static var velocidad_nube:int = 500
#el resto de variables
@onready var jugador: CharacterBody2D = $"../jugador"
@onready var timer: Timer = $Timer
@onready var nube: AnimatedSprite2D = $AnimatedSprite2D
@onready var rayo_arriba: RayCast2D = $RayCast2D
@onready var rayo_abajo: RayCast2D = $RayCast2D2

# delta es el tiempo desde el anterior frame.
func _process(delta: float) -> void:
	#mueve a la nube por la velocidad dada multiplicado por delta
	position = position - Vector2(velocidad_nube * delta,0)
	
	#si alguno de los rayos colisiona con el jugador suma los puntos 
	#se elimina el rayo asi no suma mas de un punto
	if rayo_arriba.is_colliding() or rayo_abajo.is_colliding():
		Global.puntos += 1
		Global.racha += 1
		rayo_arriba.enabled = false
		rayo_abajo.enabled = false
		
		#si los puntos actuales son mayores al mejor, lo sube
		#igual con la racha
		if Global.puntos > Guardar.mejor_puntaje:
			Guardar.mejor_puntaje = Global.puntos
		if Global.racha > Guardar.mejor_racha:
			Guardar.mejor_racha = Global.racha

#tocar la nube con el dragon
func _on_body_entered(_body: Node2D) -> void:
	#si la nube es normal o no cambia el comportamiento
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
