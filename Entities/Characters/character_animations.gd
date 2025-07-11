extends AnimationPlayer

var facing = "DownRight"
var animation_locked = false

func _ready():
	animation_finished.connect(_on_animation_finished)


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		get_parent().queue_free()
	animation_locked = false
	self.play("RESET")
	self.seek(1)
	
	
func set_facing(direction: Vector2):
	if direction.x > 0:
		if direction.y > 0:
			facing = "DownRight"
		else:
			facing = "UpRight"
	elif direction.x < 0:
		if direction.y > 0:
			facing = "DownLeft"
		else:
			facing = "UpLeft"
	
	
func play_idle_animation():
	if not animation_locked:
		self.play("idle" + facing)
	
	
func play_random_idle_animation():
	if animation_locked:
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
	if not animation_locked:
		self.play("move" + facing)


func play_attack_animation(input_direction: Vector2):
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


func play_damaged_animation():
	self.play("damaged" + facing)
	animation_locked = true
	
func play_death_animation():
	self.play("death")
	animation_locked = true
