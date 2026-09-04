extends VBoxContainer

@onready var label_puntajemax: Label = $"../PanelContainer/HBoxContainer/mejor puntaje"
@onready var label_rachamax: Label = $"../PanelContainer/HBoxContainer/mejor racha"

func _ready() -> void:
	Guardar._load()
	
	label_puntajemax.text = "Mejor puntaje: " + str(Guardar.mejor_puntaje)
	label_rachamax.text = "Mejor racha: " + str(Guardar.mejor_racha)
func boton1() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func boton3() -> void:
	get_tree().quit()
