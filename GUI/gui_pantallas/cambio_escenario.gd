extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#Usamos las variabes locales de score
	Score.max_score()
	#mostramos el score de la partida
	$text_score.text=("("+str(Score.score)+")")
	#mostramos el mejor score de las partidas
	$text_preg.text=("("+str(Score.puntaje_max)+")")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_menu_pressed():
	#self.queue_free()
	#get_tree().change_scene("res://Inicio/Inicio.tscn")
	#pass # Replace with function body.


#func _on_reiniciar_pressed():
#	self.queue_free()
#	Score.score=10
#	Score.num_pre=0
#	get_tree().change_scene("res://main.tscn")
#	pass # Replace with function body.




func _on_continuar_pressed():
	self.queue_free()
	Score.anim=2
	get_tree().change_scene("res://main2/main2.tscn")
	pass # Replace with function body.


func _on_menu_pressed():
	self.queue_free()
	get_tree().change_scene("res://Inicio/Inicio.tscn")
	pass # Replace with function body.


func _on_reiniciar_pressed():
	self.queue_free()
	Score.score=10
	Score.num_pre=0
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.
