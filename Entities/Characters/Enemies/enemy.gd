class_name Enemy extends Character


func _init(spd):
	super(spd)
	set_collision_mask_value(5, true)


func _ready():
	$AnimationPlayer.play_random_idle_animation()
	
		
#func play_move_animation():
	#if velocity == Vector2.ZERO and not $AnimationPlayer.current_animation.contains("idle"):
		#$AnimationPlayer.play_random_idle_animation()
	#elif velocity.x > 0:
		#if velocity.y > 0:
			#$AnimationPlayer.play("moveDownRight")
		#else:
			#$AnimationPlayer.play("moveUpRight")
	#elif velocity.x < 0:
		#if velocity.y > 0:
			#$AnimationPlayer.play("moveDownLeft")
		#else:
			#$AnimationPlayer.play("moveUpLeft")
