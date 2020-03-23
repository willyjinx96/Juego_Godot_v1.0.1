extends Sprite


var opcion = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_rechazar_pressed():
	$animacion.play_backwards("entrada")


func _on_animacion_animation_finished(anim_name):
	if anim_name == "salida":
		print("Eliminando ventana")
		queue_free()


func _on_btn_aceptar_pressed():
	if opcion == 1:
		print("Volviendo al menu")
	elif opcion == 2:
		print("Reiniciando nivel...")
	$animacion.play("salida")
	
func set_opcion(opc):
	opcion = opc

func set_mensaje(msj):
	$mensaje_emergente.text=msj
