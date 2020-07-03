extends Sprite
onready var main = get_parent()

func _ready():
	$animacion.play("entrada")
	$fx_entrada.play()
	pass # Replace with function body.

#funcion al presionar el boton volver
func _on_btn_volver_pressed():
	if get_tree().paused == true:
		main.cont_pausa()
		#get_tree().paused = false
		$animacion.play("salida")
		$fx_salida.play()

#funcion cuando terminar la animacion de salida
func _on_animacion_animation_finished(anim_name):
	if anim_name == "salida":
		queue_free()


func _on_btn_sonido_pressed():
	if Score.musica==true:
		main.parar_musica()
	else:
		main.play_musica()

var vtn_emer = preload("res://GUI/gui_pantallas/ventana_emergente.tscn")

func _on_btn_reiniciar_pressed():
	var ventana =vtn_emer.instance()
	get_parent().add_child(ventana)
	ventana.set_mensaje("ESTA SEGURO DE QUE QUIERE REINICIAR EL NIVEL?")
	ventana.set_opcion(2)


func _on_btn_menu_pressed():
	var ventana =vtn_emer.instance()
	get_parent().add_child(ventana)
	ventana.set_mensaje("ESTA SEGURO DE QUE QUIERE VOLVER AL MENU??")
	ventana.set_opcion(1)
