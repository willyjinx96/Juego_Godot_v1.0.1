extends Position2D

var power_ups = [preload("res://Power_up/bandera.tscn")]

var tiempo = 0.0
var intervalo = 30
var intervalo_min = 30
var intervalo_max = 90

func _physics_process(delta):
	tiempo += delta 
	if tiempo >= intervalo:
		tiempo = 0
		
		var c = rand_range(0, power_ups.size())
		get_parent().add_child(power_ups[c].instance())
		intervalo = rand_range(intervalo_min, intervalo_max)
