extends Area2D
var velocidad = Vector2(-400, 0)
var tiempo_vida = 7
#Llamamos a las escenas con las que interactua Genoveva
onready var jugador = get_parent().get_node("jugador")
onready var main = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	if Score.anim == 1:
		$genoveva.animation = "caminando"
	else :
		$genoveva.animation = "caminando2"
	pass # Replace with function body.

func _process(delta):
	set_position(position + (velocidad-Score.velocidad_global) * delta)
	tiempo_vida = tiempo_vida - delta
	if tiempo_vida <= 0:
		queue_free()
		
#Cuando haya colision con Juancito		
func _on_genoveva_area_entered(area):
	if area.name == "jugador":
		if Score.anim == 1:		
			$genoveva.animation = "entregar"
		else:
			$genoveva.animation = "entregar2"
		jugador.agarrando()
		Score.score_vel+=40
		Score.score +=40
		main.add_vidas()
		velocidad = Vector2(0,0)

#Cuando dejen de colisionar con Juancito
func _on_genoveva_area_exited(area):
	if area.name == "jugador":
		jugador.normalidad()


func _on_genoveva_animation_finished():
	if Score.anim == 1:
		if $genoveva.animation == "entregar":
			$genoveva.animation = "caminando"
			velocidad =Vector2(-400, 0)
	else :
		if $genoveva.animation == "entregar2":
			$genoveva.animation = "caminando2"
			velocidad =Vector2(-400, 0)
	
