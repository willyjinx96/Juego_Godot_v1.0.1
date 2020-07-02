extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#Usamos las variabes locales de score
	Score.max_score()
	#mostramos el score de la partida
	$txt_score.text=("("+str(Score.score)+")")
	#mostramos el mejor score de las partidas
	$txt_best.text=("("+str(Score.puntaje_max)+")")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Para el boton de menu
func _on_menu_pressed():
	self.queue_free()
	get_tree().change_scene("res://Inicio/Inicio.tscn")
	pass # Replace with function body.

#Para el boton de reinicio
func _on_reiniciar_pressed():
	self.queue_free()
	Score.score=10
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.
