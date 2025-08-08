extends AnimationPlayer

var facing = "DownRight"

# func _ready():
# 	animation_finished.connect(_on_animation_finished)


func play_with_facing(animation_name: String) -> void:
	self.play(animation_name + facing)


# func _on_animation_finished(_anim_name: StringName) -> void:
# 	# if anim_name == "death":
# 	# 	get_parent().queue_free()
# 	# elif anim_name == "fall":
# 	# 	Global.fall_finished.emit(get_parent())
# 	# self.play("RESET")
# 	# self.seek(1)
# 	pass
	
	
func set_facing(direction: Vector2):
	if direction.x >= 0:
		if direction.y >= 0:
			facing = "DownRight"
		else:
			facing = "UpRight"
	elif direction.x < 0:
		if direction.y >= 0:
			facing = "DownLeft"
		else:
			facing = "UpLeft"
	
	
# func play_idle_animation():
# 	if not self.current_animation.contains("idle"):
# 		self.play("idle" + facing)
	
	
# func play_random_idle_animation():
# 	if self.current_animation.contains("idle"):
# 		return
# 	var random_idle = Global.rng.randi_range(1, 4)
# 	if random_idle == 1:
# 		facing = "DownRight"
# 	elif random_idle == 2:
# 		facing = "DownLeft"
# 	elif random_idle == 3:
# 		facing = "UpRight"
# 	else:
# 		facing = "UpLeft"
# 	self.play_idle_animation()
# 	var random_time = Global.rng.randf_range(0, self.current_animation_length)
# 	self.seek(random_time)
	
	
func play_animation_with_input(anim_name: String, input_direction: Vector2):
	if input_direction == Vector2(0, -1):
		if facing.contains("Left"):
			self.play(anim_name + "UpSlashLeft")
		else:
			self.play(anim_name + "UpSlashRight")
	elif input_direction == Vector2(0, 1):
		if facing.contains("Left"):
			self.play(anim_name + "DownSlashLeft")
		else:
			self.play(anim_name + "DownSlashRight")
	elif input_direction == Vector2(-1, 0):
		if facing.contains("Up"):
			self.play(anim_name + "UpSlashLeft")
		else:
			self.play(anim_name + "DownLeft")
	elif input_direction == Vector2(1, 0):
		if facing.contains("Up"):
			self.play(anim_name + "UpRight")
		else:
			self.play(anim_name + "DownRight")
	else: 
		self.play(anim_name + facing)


func play_animation_with_direction(anim_name: String, direction: Vector2):
	var down = PI / 2
	var down_left = 5 * PI / 8
	var down_right = 3 * PI / 8
	var up = -PI / 2
	var up_left = -5 * PI / 8
	var up_right = -3 * PI / 8
	var left = PI
	var negative_left = -PI
	var right = 0
	var angle = direction.angle()
	if down_right < angle and angle <= down:
		self.play(anim_name + "DownSlashRight")
	elif down < angle and angle <= down_left:
		self.play(anim_name + "DownSlashLeft")
	elif up_left < angle and angle <= up:
		self.play(anim_name + "UpSlashLeft")
	elif up < angle and angle <= up_right:
		self.play(anim_name + "UpSlashRight")
	elif right < angle and angle <= down:
		self.play(anim_name + "DownRight")
	elif down < angle and angle <= left:
		self.play(anim_name + "DownLeft")
	elif negative_left <= angle and angle <= up:
		self.play(anim_name + "UpLeft")
	else:
		self.play(anim_name + "UpRight")
