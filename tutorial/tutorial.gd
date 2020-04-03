extends AnimatedSprite

func _on_btn_jugar_pressed():
	get_tree().change_scene("res://main.tscn")

func _on_btn_menu_pressed():
	get_tree().change_scene("res://Inicio/Inicio.tscn")
