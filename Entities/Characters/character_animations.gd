extends AnimationPlayer

var facing = "DownRight"

const down = PI / 2
const down_left = 5 * PI / 8
const down_right = 3 * PI / 8
const up = -PI / 2
const up_left = -5 * PI / 8
const up_right = -3 * PI / 8
const left = PI
const negative_left = -PI
const right = 0

	
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
	

func play_with_facing(anim_name: String) -> void:
	self.play(anim_name + facing)


func play_six_way(anim_name: String, direction: Vector2) -> void:
	var angle = direction.angle()
	if down_right < angle and angle <= down_left:
		self.play(anim_name + "Down") 
	elif up_left < angle and angle <= up_right:
		self.play(anim_name + "Up") 
	else:
		play_with_facing(anim_name)


func play_eight_way(anim_name: String, direction: Vector2) -> void:
	var angle = direction.angle()
	if up_right < angle and angle <= down_right:
		self.play(anim_name + "Right") 
	elif down_left < angle or angle <= up_left:
		self.play(anim_name + "Left") 
	else:
		play_six_way(anim_name, direction)
	
	
# func play_animation_with_input(anim_name: String, input_direction: Vector2):
# 	if input_direction == Vector2(0, -1):
# 		if facing.contains("Left"):
# 			self.play(anim_name + "UpSlashLeft")
# 		else:
# 			self.play(anim_name + "UpSlashRight")
# 	elif input_direction == Vector2(0, 1):
# 		if facing.contains("Left"):
# 			self.play(anim_name + "DownSlashLeft")
# 		else:
# 			self.play(anim_name + "DownSlashRight")
# 	elif input_direction == Vector2(-1, 0):
# 		if facing.contains("Up"):
# 			self.play(anim_name + "UpSlashLeft")
# 		else:
# 			self.play(anim_name + "DownLeft")
# 	elif input_direction == Vector2(1, 0):
# 		if facing.contains("Up"):
# 			self.play(anim_name + "UpRight")
# 		else:
# 			self.play(anim_name + "DownRight")
# 	else: 
# 		self.play(anim_name + facing)


# func play_animation_with_direction(anim_name: String, direction: Vector2):
# 	var angle = direction.angle()
# 	if down_right < angle and angle <= down:
# 		self.play(anim_name + "DownSlashRight")
# 	elif down < angle and angle <= down_left:
# 		self.play(anim_name + "DownSlashLeft")
# 	elif up_left < angle and angle <= up:
# 		self.play(anim_name + "UpSlashLeft")
# 	elif up < angle and angle <= up_right:
# 		self.play(anim_name + "UpSlashRight")
# 	elif right < angle and angle <= down:
# 		self.play(anim_name + "DownRight")
# 	elif down < angle and angle <= left:
# 		self.play(anim_name + "DownLeft")
# 	elif negative_left <= angle and angle <= up:
# 		self.play(anim_name + "UpLeft")
# 	else:
# 		self.play(anim_name + "UpRight")
