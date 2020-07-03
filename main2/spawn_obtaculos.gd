extends Position2D

var enemigos = [preload("res://Obstaculos/tnt.tscn"), preload("res://Obstaculos/bala.tscn")]

var tiempo = 0.0
var intervalo = 3
var intervalo_min = 1
var intervalo_max = 4
var cambio = 200
func _physics_process(delta):
	tiempo += delta 
	if tiempo >= intervalo:
		tiempo = 0
		
		var c = rand_range(0, enemigos.size())
		get_parent().add_child(enemigos[c].instance())
		
		if Score.score >= cambio:
			intervalo_max -=0.1
			intervalo_min -=0.2
			if intervalo_min <0:
				intervalo_min=0
			if intervalo_max<0:
				intervalo_max=0.8
			cambio +=200
			print("CAmbiando tiempo...")
		intervalo = rand_range(intervalo_min, intervalo_max)
