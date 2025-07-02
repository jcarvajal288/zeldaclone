extends Camera2D

func _process(delta: float):
	if Input.is_action_just_pressed("ui_home"):
		self.position = Vector2(0, -120)
	elif Input.is_action_just_pressed("ui_end"):
		self.position = Vector2(0, 0)
