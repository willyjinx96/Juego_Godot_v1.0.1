extends Node2D

const SQLite = preload("res://lib/gdsqlite.gdns")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var preguntas = []
# Called when the node enters the scene tree for the first time.
func _ready():
	var db = SQLite.new()
	#Abrimos nuestra base de datos
	db.open_db("res://Data_Base/JUEGO_PACIFICO.db")
	
	var id_pregunta = 78
	#Realizamos la consulta
	var consulta = db.fetch_array("SELECT pregunta, id_opc FROM preguntas WHERE id_preg =" + str(id_pregunta))
	
	#Crearemos el objeto pregunta :v
	var pregunta = {
		'pregunta':consulta[0]['pregunta'],
		'respuesta':consulta[0]['id_opc']
	}
	print(pregunta)
#	var consulta= db.fetch_array("SELECT pregunta, id_preg FROM preguntas")
#
#	if (not consulta or consulta.empty()):
#		return;
#
#	for i in consulta:
#		var pregunta = {
#			'pregunta':i['pregunta'],
#			'id':i['id_preg']
#		}
#		preguntas.append(pregunta)
#
#		preguntas.shuffle()
#
#	for i in preguntas:
#		print("Pregunta: ", i.pregunta,"\tID: ", i.id);
	pass # Replace with function body.
