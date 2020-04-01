extends Sprite


var opcion = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$fx_sonido.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_rechazar_pressed():
	$btn_rechazar/fx_rechazar.play()
	$animacion.play_backwards("entrada")


func _on_animacion_animation_finished(anim_name):
	if anim_name == "salida":
		print("Eliminando ventana")
		queue_free()


func _on_btn_aceptar_pressed():
	$btn_aceptar/fx_aceptar.play()
	if opcion == 1:
		get_tree().change_scene("res://Inicio/Inicio.tscn")
		get_tree().paused = false
		print("Volviendo al menu")
	elif opcion == 2:
		get_tree().reload_current_scene()
		Score.mezclar()
		get_tree().paused = false
		Score.score=10
		print("Reiniciando nivel...")
	elif opcion == 3:
		get_tree().quit()
	$animacion.play("salida")
	
func set_opcion(opc):
	opcion = opc

func set_mensaje(msj):
	$mensaje_emergente.text=msj
