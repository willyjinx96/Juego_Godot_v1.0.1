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
	var consulta= db.fetch_array("SELECT pregunta, id_preg FROM preguntas")
	
	if (not consulta or consulta.empty()):
		return;
	
	for i in consulta:
		var pregunta = {
			'pregunta':i['pregunta'],
			'id':i['id_preg']
		}
		preguntas.append(pregunta)
		
		
	for i in preguntas:
		print("Pregunta: ", i.pregunta,"\tID: ", i.id);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	preguntas.shuffle()
