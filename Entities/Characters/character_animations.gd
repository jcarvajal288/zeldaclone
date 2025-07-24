extends AnimationPlayer

var facing = "DownRight"
var animation_locked = false

func _ready():
	animation_finished.connect(_on_animation_finished)


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		get_parent().queue_free()
	elif anim_name == "fall":
		Global.fall_finished.emit(get_parent())
	animation_locked = false
	if is_instance_of(get_parent(), Player):
		print("RESET")
	self.play("RESET")
	self.seek(1)
	
	
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
	
	
func play_idle_animation():
	if not (animation_locked or self.current_animation.contains("idle")):
		self.play("idle" + facing)
	
	
func play_random_idle_animation():
	if animation_locked or self.current_animation.contains("idle"):
		return
	var random_idle = Global.rng.randi_range(1, 4)
	if random_idle == 1:
		facing = "DownRight"
	elif random_idle == 2:
		facing = "DownLeft"
	elif random_idle == 3:
		facing = "UpRight"
	else:
		facing = "UpLeft"
	self.play_idle_animation()
	var random_time = Global.rng.randf_range(0, self.current_animation_length)
	self.seek(random_time)
	
	
func play_move_animation():
	# if not animation_locked:
	self.play("move" + facing)


func play_attack_animation_with_input(input_direction: Vector2):
	if input_direction == Vector2(0, -1):
		if facing.contains("Left"):
			self.play("attackUpSlashLeft")
		else:
			self.play("attackUpSlashRight")
	elif input_direction == Vector2(0, 1):
		if facing.contains("Left"):
			self.play("attackDownSlashLeft")
		else:
			self.play("attackDownSlashRight")
	elif input_direction == Vector2(-1, 0):
		if facing.contains("Up"):
			self.play("attackUpSlashLeft")
		else:
			self.play("attackDownLeft")
	elif input_direction == Vector2(1, 0):
		if facing.contains("Up"):
			self.play("attackUpRight")
		else:
			self.play("attackDownRight")
	else: 
		self.play("attack" + facing)
	animation_locked = true


func play_attack_animation_with_direction(direction: Vector2):
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
		self.play("attackDownSlashRight")
	elif down < angle and angle <= down_left:
		self.play("attackDownSlashLeft")
	elif up_left < angle and angle <= up:
		self.play("attackUpSlashLeft")
	elif up < angle and angle <= up_right:
		self.play("attackUpSlashRight")
	elif right < angle and angle <= down:
		self.play("attackDownRight")
	elif down < angle and angle <= left:
		self.play("attackDownLeft")
	elif negative_left <= angle and angle <= up:
		self.play("attackUpLeft")
	else:
		self.play("attackUpRight")
	animation_locked = true
		


func play_damaged_animation():
	self.play("damaged" + facing)
	animation_locked = true
	

func play_death_animation():
	self.play("death")
	animation_locked = true


func play_fall_animation():
	self.play("fall")
	animation_locked = true