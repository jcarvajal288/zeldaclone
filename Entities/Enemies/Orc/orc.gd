extends CharacterBody2D

var facing = "DownRight"
var max_health = 3
var current_health = max_health

func _ready():
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

func _on_hurtbox_area_entered(hitbox: Hitbox) -> void:
	current_health -= hitbox.damage
	if current_health > 0:
		$AnimationPlayer.play("damaged" + facing)
	else:
		$AnimationPlayer.play("Death")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		queue_free()
	elif anim_name.begins_with("damaged"):
		$AnimationPlayer.play("idle" + facing)
