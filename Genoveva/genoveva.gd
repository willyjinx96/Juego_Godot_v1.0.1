extends Area2D

var pos = position
var piso = pos
var velocidad = Vector2(-300, 0)
onready var main = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	$genoveva.animation = "caminando"

func _process(delta):
	set_position(pos + velocidad * delta)


func _on_genoveva_area_entered(area):
	if area.name == "jugador":
		main.add_tambor()
		$genoveva.animation = "entregar"
