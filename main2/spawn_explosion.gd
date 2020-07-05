extends Position2D

var explo = [preload("res://explosion/explosion.tscn")]

var tiempo = 0.0
export var  intervalo = 25
var intervalo_min = 20
var intervalo_max = 90

func _physics_process(delta):
	tiempo += delta 
	if tiempo >= intervalo:
		tiempo = 0
		
		var c = rand_range(0, explo.size())
		get_parent().add_child(explo[c].instance())
		intervalo = rand_range(intervalo_min, intervalo_max)
