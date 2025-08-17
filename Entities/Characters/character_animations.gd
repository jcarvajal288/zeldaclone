extends AnimationPlayer

var facing = "DownRight"


func play_with_facing(animation_name: String) -> void:
	self.play(animation_name + facing)
	
	
func set_facing(direction: Vector2):
	if direction == Vector2.ZERO:
		return
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
