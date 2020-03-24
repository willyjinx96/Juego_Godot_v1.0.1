extends Position2D

var genoveva_scene = preload("res://Genoveva/genoveva.tscn")

func _ready():
	pass # Replace with function body.

func instanciarGenoveva():    #crearFuego
	var genoveva = genoveva_scene.instance()
	get_tree().get_nodes_in_group("principal")[0].add_child(genoveva)
	genoveva.global_position = global_position

