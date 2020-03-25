#Suelo
extends ParallaxBackground
var parallax_offset = Vector2()
var velocidad = Vector2(-300, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Score.verf_score(Score.score)
	parallax_offset -= (velocidad-Score.velocidad_global)* -delta
	set_scroll_offset(parallax_offset)
