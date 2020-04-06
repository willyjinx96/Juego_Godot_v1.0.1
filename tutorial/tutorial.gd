extends AnimatedSprite

func _on_btn_jugar_pressed():
	get_tree().change_scene("res://main.tscn")

func _on_btn_menu_pressed():
	get_tree().change_scene("res://Inicio/Inicio.tscn")

func _ready():
	$theme.play()
	animation="tuto1"

func _on_next_pressed():
	$flipping_book.play()
	$prev.disabled=false
	animation="tuto2"
	$next.disabled=true
	pass # Replace with function body.


func _on_prev_pressed():
	$flipping_book.play()
	$next.disabled=false
	animation="backtuto1"
	$prev.disabled=true
	pass # Replace with function body.


func _on_theme_finished():
	$theme.play()
