extends Node

const ruta_guardado = "user://SafeFile.json"

var datos_guardables: Dictionary = {
	"Mejor puntaje" : Global.mejor_puntaje,
	"Mejor racha" : Global.mejor_racha
	}

func _save() -> void:
	var file = FileAccess.open(ruta_guardado,FileAccess.WRITE)
	file.store_var(datos_guardables.duplicate())
	file.close()

func _load() -> void:
	if FileAccess.file_exists(ruta_guardado):
		var file = FileAccess.open(ruta_guardado,FileAccess.READ)
		var datos = file.get_var()
		file.close()
		
		var datos_guardados = datos.duplicate()
		Global.mejor_puntaje = datos_guardados.mejor_puntaje
		Global.mejor_racha = datos_guardados.mejor_racha
		
