extends CharacterBody2D

const JUMP_VELOCITY = -400.0
@export var puede_volar:bool = true
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# pone la gravedadgravedad.
	velocity += get_gravity() * delta
	# boton para volar.
	if Input.is_action_just_pressed("volar") and puede_volar:
		velocity.y = JUMP_VELOCITY
		sprite.play("vuelo")
	move_and_slide()
