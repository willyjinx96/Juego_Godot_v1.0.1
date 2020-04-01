extends Control

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var vtn_emer = preload("res://GUI/gui_pantallas/ventana_emergente.tscn")

func _on_salir_pressed():
	var ventana =vtn_emer.instance()
	get_parent().add_child(ventana)
	ventana.set_mensaje("ESTA SEGURO DE QUE QUIERE SALIR DEL JUEGO?")
	ventana.set_opcion(3)


func _on_jugar_pressed():
	Score.mezclar()
	get_tree().change_scene("res://main.tscn")
	


func _on_tutorial_pressed():
	print("Abriendo Tutorial..")
	pass # Replace with function body.



func _on_theme_finished():
	$theme.play()
	pass # Replace with function body.
