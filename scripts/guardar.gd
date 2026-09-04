extends Node

const ruta_guardado = "/home/Diana/SafeFile.json"

var mejor_racha:int 
var mejor_puntaje:int 


func _save() -> void:
	var datos_guardables: Dictionary = {
	"Mejor_puntaje" : mejor_puntaje,
	"Mejor_racha" : mejor_racha
	}
	print_debug(datos_guardables)
	var file = FileAccess.open(ruta_guardado,FileAccess.WRITE)
	file.store_var(datos_guardables.duplicate())
	file.close()

func _load() -> void:
	if FileAccess.file_exists(ruta_guardado):
		var file = FileAccess.open(ruta_guardado,FileAccess.READ)
		var datos = file.get_var()
		file.close()
		
		var datos_guardados = datos.duplicate()
		print_debug(datos_guardados)
		mejor_puntaje = datos_guardados.Mejor_puntaje
		mejor_racha = datos_guardados.Mejor_racha
	else:
		print("no hay datos guardados")
