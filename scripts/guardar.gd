extends Node

const ruta_guardado = "/home/Diana/SafeFile.json"

var mejor_racha:int 
var mejor_puntaje:int 


func _save() -> void:
	#crea un diccionario con las variables a guardar
	var datos_guardables: Dictionary = {
	"Mejor_puntaje" : mejor_puntaje,
	"Mejor_racha" : mejor_racha
	}
	
	#abre el archivo en la ruta dada arriba en modo de escritura, si no existe lo crea
	var file = FileAccess.open(ruta_guardado,FileAccess.WRITE)
	
	#guarda un duplicado del directorio en el archivo abierto y lo cierra
	file.store_var(datos_guardables.duplicate())
	file.close()

func _load() -> void:
	# pregunta si el archivo existe, si no existe no carga nada
	if FileAccess.file_exists(ruta_guardado):
		#abre el archivo en modo solo lectura
		var file = FileAccess.open(ruta_guardado,FileAccess.READ)
		#agarra los datos guardados y cierra el archivo
		var datos = file.get_var()
		file.close()
		
		#duplica los datos guardados, la verdad no entendi por que lo hace pero el tutorial decia que lo haga
		var datos_guardados = datos.duplicate()
		
		#carga los datos guardados en las variables correspondientes
		mejor_puntaje = datos_guardados.Mejor_puntaje
		mejor_racha = datos_guardados.Mejor_racha
