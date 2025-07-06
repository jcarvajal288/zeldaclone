extends CharacterBody2D

func _ready():
	var random_idle = Global.rng.randi_range(1, 4)
	if random_idle == 1:
		$AnimationPlayer.play("idleDownRight")
	elif random_idle == 2:
		$AnimationPlayer.play("idleDownLeft")
	elif random_idle == 3:
		$AnimationPlayer.play("idleUpRight")
	else:
		$AnimationPlayer.play("idleUpLeft")
	var random_time = Global.rng.randf_range(0, $AnimationPlayer.current_animation_length)
	$AnimationPlayer.seek(random_time)

func _on_hurtbox_area_entered(area: Hitbox) -> void:
	$AnimationPlayer.play("Death")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		queue_free()
