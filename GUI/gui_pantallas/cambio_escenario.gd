extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Score.max_score()
	$txt_score.text=("("+str(Score.score)+")")
	$txt_best.text=("("+str(Score.puntaje_max)+")")
	$preguntas_correctas.text=("("+str(Score.preg_acertadas)+")")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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


func _on_continuar_pressed():
	pass	
