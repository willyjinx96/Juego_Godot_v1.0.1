#COMENTARIO DE MAYDA :P ........................

extends Node2D

#Para las vidas por defecto 3
export var vidas = 3
var c_vidas= vidas
var offset_vida = 80
var vida = preload("res://GUI/vida.tscn")
var lista_vidas = []

# para los ataques de tambor
export var tambores = 3
var tambor = preload("res://GUI/tambor_ataque.tscn")
var lista_tambores = []

# para la barra de banderas
var banderas = 0
var bandera = preload("res://GUI/bandera_animacion.tscn")

var genoveva = preload("res://Genoveva/genoveva.tscn")

func _ready():
	Score.mezclar()
	crear_vidas()
	crear_tambores()
	play_musica()
	#$text_contador.visible=false
	
func _process(delta):
	
	var ventana = preload("res://GUI/gui_pantallas/ventana_pausa.tscn") 
	if Input.is_action_just_pressed("ui_accept"):
		if	get_tree().paused == false:
			get_tree().get_nodes_in_group("principal")[0].add_child(ventana.instance())
			get_tree().paused = true
	
	$num_score.text=("("+str(Score.score)+")")
	#$text_contador.text=str(ceil($contador.time_left))
	
	if not $contador.is_stopped() :
		#$text_contador.visible=true
		#print(ceil($contador.time_left))
		$text_contador.text=str(ceil($contador.time_left))
	else:
		$text_contador.text="CONTINUA...!!!"
		pass
		
#	if Input.is_action_just_pressed("ui_left"):
#		if banderas>0:
#			var n_ban =bandera.instance()
#			n_ban.activa()
	#Score.verf_score(Score.score)
	
func crear_vidas():
	#vidas =3
	for i in vidas:
		var nueva_vida = vida.instance()
		get_tree().get_nodes_in_group("gui")[0].add_child(nueva_vida)
		nueva_vida.global_position = $barra_vidas.global_position
		nueva_vida.global_position.x += offset_vida * i
		lista_vidas.append(nueva_vida)
	

func quitar_vidas():
	if vidas > 1:
		vidas -= 1
		print("vidas restantes: ", vidas)
		lista_vidas[vidas].queue_free()
		lista_vidas.resize(vidas)
	else:
		print("moriste")
		get_tree().change_scene("res://GUI/gui_pantallas/game_over.tscn")

func add_vidas():
	if vidas < 3:
		c_vidas = c_vidas-vidas
		for i in c_vidas:
			var nueva_vida= vida.instance()
			get_tree().get_nodes_in_group("gui")[0].add_child(nueva_vida)
			nueva_vida.global_position = $barra_vidas.global_position
			nueva_vida.global_position.x += offset_vida * lista_vidas.size()
			lista_vidas.append(nueva_vida)
			vidas +=1
		print(c_vidas," vidas agregadas")
		c_vidas=vidas

func crear_tambores():
	for i in tambores:
		var nuevo_tambor = tambor.instance()
		get_tree().get_nodes_in_group("gui")[1].add_child(nuevo_tambor)
		nuevo_tambor.global_position = $barra_tambor.global_position
		nuevo_tambor.global_position.x += offset_vida * i
		lista_tambores.append(nuevo_tambor)

func add_tambor():
	if tambores < 3:
		tambores += 1
		var nuevo_tambor = tambor.instance()
		get_tree().get_nodes_in_group("gui")[1].add_child(nuevo_tambor)
		nuevo_tambor.global_position = $barra_tambor.global_position
		nuevo_tambor.global_position.x += offset_vida * lista_tambores.size()
		lista_tambores.append(nuevo_tambor)

		
func quitar_tambores():
	if tambores > 0:
		tambores -= 1
		lista_tambores[tambores].queue_free()
		lista_tambores.resize(tambores)
	else:
		
		print("sin tambor")
				
#func crear_banderas():
#	for i in banderas:
#		var nueva_bandera = bandera.instance()
#		get_tree().get_nodes_in_group("gui")[2].add_child(nueva_bandera)
#		nueva_bandera.global_position = $barra_bandera.global_position
#		nueva_bandera.global_position.x += offset_vida * i
#		lista_banderas.append(nueva_bandera)

func add_bandera():
	if banderas == 0:
		banderas = 1
#		var nueva_bandera = bandera.instance()
#		get_tree().get_nodes_in_group("gui")[2].add_child(nueva_bandera)
#		nueva_bandera.global_position = $barra_bandera.global_position
#		nueva_bandera.global_position.x += offset_vida * lista_banderas.size()
#		lista_banderas.append(nueva_bandera)

#func quitar_banderas():
#	print(banderas)
#	if banderas > 0:
#		banderas -= 1
#		lista_banderas[banderas].queue_free()
#		lista_banderas.resize(banderas)
#	else:
#		print("sin bandera")

func _on_jugador_fuego():
	$spawn_fireball.crearFuego()
	quitar_tambores()

func _on_jugador_geno():
	$spawn_genoveva.instanciarGenoveva()
	#quitar_banderas()
	

#Cuando ternina la cancion
func _on_musica_principal_finished():
	if Score.musica==true:
		$musica_principal.play()

func parar_musica():
	$musica_principal.playing=false
	Score.musica=false

func play_musica():
	$musica_principal.play()
	Score.musica =true

func _on_ambiente_finished():
	$ambiente.play()
	
# este comentario es para ver los cambios en el git dev_willy



func _on_contador_timeout():
	if get_tree().paused == true:
		get_tree().paused = false
		$contador.stop()
		$text_contador/AnimationPlayer.play("anim")

func cont_pausa():
	#$text_contador.visible=true
	$contador.start()
	$text_contador/AnimationPlayer.play("entrada")
