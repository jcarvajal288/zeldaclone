extends AnimationPlayer

var facing = "DownRight"

const DOWN_LEFT = 5 * PI / 8
const DOWN_RIGHT = 3 * PI / 8
const UP_LEFT = -5 * PI / 8
const UP_RIGHT = -3 * PI / 8

# const DOWN = PI / 2
# const UP = -PI / 2
# const LEFT = PI
# const NEGATIVE_LEFT = -PI
# const RIGHT = 0

	
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
	if DOWN_RIGHT < angle and angle <= DOWN_LEFT:
		self.play(anim_name + "Down") 
	elif UP_LEFT < angle and angle <= UP_RIGHT:
		self.play(anim_name + "Up") 
	else:
		play_with_facing(anim_name)


func play_eight_way(anim_name: String, direction: Vector2) -> void:
	var dirString = Global.convert_to_8_way(direction)
	self.play(anim_name + dirString)
	
	
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
# 	if DOWN_RIGHT < angle and angle <= DOWN:
# 		self.play(anim_name + "DownSlashRight")
# 	elif DOWN < angle and angle <= DOWN_LEFT:
# 		self.play(anim_name + "DownSlashLeft")
# 	elif UP_LEFT < angle and angle <= UP:
# 		self.play(anim_name + "UpSlashLeft")
# 	elif UP < angle and angle <= UP_RIGHT:
# 		self.play(anim_name + "UpSlashRight")
# 	elif RIGHT < angle and angle <= DOWN:
# 		self.play(anim_name + "DownRight")
# 	elif DOWN < angle and angle <= LEFT:
# 		self.play(anim_name + "DownLeft")
# 	elif NEGATIVE_LEFT <= angle and angle <= UP:
# 		self.play(anim_name + "UpLeft")
# 	else:
# 		self.play(anim_name + "UpRight")
