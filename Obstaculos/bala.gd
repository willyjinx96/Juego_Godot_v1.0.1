extends Area2D
var velocidad = Vector2(-400, 0) 
var tiempo_vida = 5
onready var jugador = get_parent().get_node("jugador")
onready var main = get_parent()
var salto =false
signal choco
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	set_position(position + (velocidad-Score.velocidad_global) * delta)
	tiempo_vida = tiempo_vida - delta
	if tiempo_vida <= 0:
		queue_free()
	if get_position().x < jugador.get_position().x:
		if not salto:
			salto=true
			Score.score += 30
			Score.score_vel+=30


func _on_bala_area_entered(area):
	if area.name == "jugador":
		emit_signal("choco")
		Score.score-=10
		jugador.choca()
		main.quitar_vidas()
		hide()
		print("bala")
		
	elif area.name == "fireball":
		Score.score_vel+=20
		Score.score+=20
		queue_free()


func _on_bala_area_exited(area):
	jugador.normalidad()


func _on_bala_choco():
	salto =true
