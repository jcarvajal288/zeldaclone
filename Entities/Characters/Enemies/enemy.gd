class_name Enemy extends Character


func _init(spd):
	super(spd)
	set_collision_mask_value(5, true)


func _ready():
	play_random_idle_animation()
	

func play_random_idle_animation():
	var random_idle = Global.rng.randi_range(1, 4)
	if random_idle == 1:
		$AnimationPlayer.play("idleDownRight")
		facing = "DownRight"
	elif random_idle == 2:
		$AnimationPlayer.play("idleDownLeft")
		facing = "DownLeft"
	elif random_idle == 3:
		$AnimationPlayer.play("idleUpRight")
		facing = "UpRight"
	else:
		$AnimationPlayer.play("idleUpLeft")
		facing = "UpLeft"
	var random_time = Global.rng.randf_range(0, $AnimationPlayer.current_animation_length)
	$AnimationPlayer.seek(random_time)
		
		
func play_move_animation():
	if velocity == Vector2.ZERO and not $AnimationPlayer.current_animation.contains("idle"):
		play_random_idle_animation()
	elif velocity.x > 0:
		if velocity.y > 0:
			$AnimationPlayer.play("moveDownRight")
		else:
			$AnimationPlayer.play("moveUpRight")
	elif velocity.x < 0:
		if velocity.y > 0:
			$AnimationPlayer.play("moveDownLeft")
		else:
			$AnimationPlayer.play("moveUpLeft")
