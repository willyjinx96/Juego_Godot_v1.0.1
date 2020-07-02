#COMENTARIO DE MAYDA :P ........................
extends Area2D

#varialbes para el movimiento del avatar
var pos = position
var piso = pos
var gravedad = 4000
var velocidad = Vector2()
var velocidad_salto = -1300
var modificador_gravedad = 2.3
onready var main = get_node("/root/main")

signal salto_sonido
var bandera = preload("res://GUI/bandera_animacion.tscn")

var n_ban=bandera.instance()
#para llamar a la escena genoveva

# para ataque
signal fuego
signal geno

func _ready():
	set_position(pos)
	normalidad()
	
func _physics_process(delta):
	#variables para el movimiento
	var saltar = Input.is_action_pressed("ui_up")
	var atacar = Input.is_action_just_pressed("ui_right")
	var agacharse = Input.is_action_pressed("ui_down")
	var agarrar = Input.is_action_just_pressed("ui_left")
#funciones para el movimiento del avatar	
	if saltar:
		velocidad.y += gravedad * delta
	else:
		velocidad.y += gravedad *delta * modificador_gravedad
	if Input.is_action_just_pressed("ui_up") and position == piso:
		#emit_signal("salto_sonido")
		$fx_salto.play()
		velocidad.y = velocidad_salto
	position += velocidad * delta
	
	
	if get_position().y > piso.y:
		set_position(piso)
		#normalidad()
		$fx_salto.stop()
		velocidad = Vector2()
	#para agacharse
	if agacharse and not atacar:
		$jugador_sprite.animation = "down"
		$CollisionShape2D.position.x = 74.604
		$CollisionShape2D.position.y = 514.211
		$fx_caminando.stop()
	if Input.is_action_just_released("ui_down"):
		$jugador_sprite.animation = "caminando"
		$CollisionShape2D.position.x = 71.068
		$CollisionShape2D.position.y = 493.705
		$CollisionShape2D.scale.x = 0.6
		$CollisionShape2D.scale.y = 1.9
		$fx_caminando.play()
	#Para el ataque
	if atacar and not (saltar or agacharse):
		if main.tambores > 0:
			$jugador_sprite.animation = "ataque"
			emit_signal("fuego")
	if Input.is_action_just_released("ui_right") and not agacharse:
		$jugador_sprite.animation = "caminando"
		
	# para llamar a Genoveva
	if agarrar:
		if main.banderas ==1:
			emit_signal("geno")
			main.banderas=0
			n_ban.activa()
			
			
		
func choca():
	$jugador_sprite.animation = "lastimado"
	$fx_danio.play()

func normalidad():
	$jugador_sprite.animation = "caminando"
	$fx_caminando.play()
	$fx_danio.stop()
	$fx_salto.stop()
	
func agarrando():
	$jugador_sprite.animation = "agarra"
	#velocidad = Vector2(0,0)
	
func _on_jugador_area_entered(area):
	if area.name == "bandera":
		#main.bandera = 1
		get_parent().add_child(n_ban)
		n_ban.inactiva()
		
#	elif area.name =="genoveva":
#		get_tree().paused=true
#		self.pause_mode=Node.PAUSE_MODE_PROCESS
#		area.pause_mode=Node.PAUSE_MODE_PROCESS
func _on_jugador_area_exited(area):
	if area.name == "genoveva":

		get_tree().paused = false
		normalidad()
		main.banderas=0
		get_parent().remove_child(n_ban)
		#n_ban.queue_free()


func _on_jugador_geno():
	main.bandera=0


func _on_jugador_salto_sonido():
	$fx_salto.play()
