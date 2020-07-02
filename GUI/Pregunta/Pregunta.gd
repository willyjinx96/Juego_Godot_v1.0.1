extends Sprite

const SQLite = preload("res://lib/gdsqlite.gdns")
var resp_correcta
var index_selected
signal sel

onready var main = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	$fx_entrada.play()
	$btn_continuar.disabled=true
	var db = SQLite.new()
	#Abrimos nuestra base de datos
	db.open_db("res://Data_Base/JUEGO_PACIFICO.db")
	
	Score.mezclar()
	var id_pregunta = Score.array_id.pop_front()
	#var id_pregunta = 24
	#Realizamos la consulta para sacar la pregunta
	var consulta_preg = db.fetch_array("SELECT pregunta, id_opc FROM preguntas WHERE id_preg =" + str(id_pregunta))
	
	#Crearemos el objeto pregunta :v
	var pregunta = {
		'pregunta':consulta_preg[0]['pregunta'],
		'respuesta':consulta_preg[0]['id_opc']
		}

	var opciones = []
	
	#Realizamos la consulta para sacar la respuesta correcta
	var id_respuesta= pregunta.respuesta

	var consulta_res = db.fetch_array("SELECT opcion, tipo FROM opcion WHERE id_opc =" + str(id_respuesta))

	var respuesta_correcta = {
		'respuesta':consulta_res[0]['opcion'],
		'tipo':consulta_res[0]['tipo']
		}

	opciones.append(respuesta_correcta.respuesta)
	print(opciones)
	resp_correcta= respuesta_correcta.respuesta
	#Realizamos la consulta para sacar las opciones
	var tipo = respuesta_correcta.tipo

	var consulta_opc = db.fetch_array("SELECT opcion FROM opcion WHERE tipo =" + str(tipo)+" AND id_opc != "+str(id_respuesta))
	var cont=1
	consulta_opc.shuffle()
	for i in consulta_opc:
		if cont<=2:
			var opc ={
				'opcion':i['opcion']
			}
			opciones.append(opc.opcion)
			cont+=1

	opciones.shuffle()

	print(pregunta.pregunta)
	$txt_pregunta.text=pregunta.pregunta
	for i in opciones:
		$ItemList.add_item(str(i))

	print(opciones)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_anim_pregunta_animation_finished(anim_name):
	if anim_name == "salida":
		queue_free()


func _on_btn_continuar_pressed():
	main.cont_pausa()
	#Llamamos a la animacion de salida de la pregunta
	$anim_pregunta.play("salida")
	#Llamamos al sonido de salida de la pregunta
	$fx_salida.play()
	#get_tree().paused=false

#Para la seleccion de las opciones
func _on_ItemList_item_selected(index):
	index_selected=index
	if not $ItemList.is_item_disabled(index):
		emit_signal("sel")
	$btn_continuar.disabled=false


func _on_Pregunta_sel():
	#guardamos la opcion seleccionada en una variable
	var option_selected = $ItemList.get_item_text(index_selected)
	#Verificamos si la opcion seleccionada es la respuesta correcta
	if resp_correcta == option_selected:
		#le sumamos 40 puntos si es la respuesta correcta
		Score.score+=40
		#Activamos las escenas y sonidos si son las respuestas correctas
		$resultado/animacion.play("correcto")
		$fx_correcto.play()
		$resultado.text="correcto"
		print("CORRECTO")
	else:
		#le restamos 40 puntos si es la respuesta incorrecta
		Score.score-=40
		#Activamos las escenas y sonidos si son las respuestas incorrectas
		$resultado/animacion.play("incorrecto")
		$resultado.text="incorrecto"
		$fx_incorrecto.play()
		print("INCORRECTO")
	pass
	for i in $ItemList.get_item_count():
		if i !=index_selected:
			$ItemList.set_item_disabled(i,true)
