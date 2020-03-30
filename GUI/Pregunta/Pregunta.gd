extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	$ItemList.add_item("Opcion 1")
	$ItemList.add_item("Opcion 2")
	$ItemList.add_item("Opcion 3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_anim_pregunta_animation_finished(anim_name):
	if anim_name == "salida":
		queue_free()


func _on_btn_continuar_pressed():
	$anim_pregunta.play("salida")
	get_tree().paused=false
