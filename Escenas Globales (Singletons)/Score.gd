extends Node2D

#variables Globales para todas las escenas
var score=10
var score_vel=0
var puntaje_max=0
#Variables para la acerelacion
var velocidad_global = Vector2(0,0)
export var cambio_vel=200

var array_id =[]
var cont =1
var limit=100
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in limit:
		array_id.append(cont)
		cont+=1
	#Ahora debemos mezclar el array
	array_id.shuffle() #suffle() mezcla los elementos del array
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func verf_score(scr):
	if scr >=cambio_vel:
		cambio_vel+=200
		velocidad_global.x+=50
		print("cambiando la vel a ",velocidad_global)
	pass

func max_score():
	if score>puntaje_max:
		puntaje_max=score
		
