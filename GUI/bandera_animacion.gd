extends AnimatedSprite

func activa():
	if Score.anim == 1:
		self.animation = "activa"
	else:
		self.animation = "activa2"
	
func inactiva():
	if Score.anim == 1:
		self.animation = "inactiva"
	else:
		self.animation = "inactiva2"
