class_name Enemy extends CharacterBody2D

var facing = "DownRight"
var max_health = 1
var current_health = max_health
var speed = 1

var animation_locked = false

func _init(hp, spd):
	max_health = hp
	current_health = max_health
	speed = spd
	set_collision_mask_value(5, true)

func _ready():
	play_random_idle_animation()
	
func _on_hurtbox_area_entered(hitbox: Hitbox) -> void:
	if hitbox.alignment == Global.Alignment.EVIL:
		return
	current_health -= hitbox.damage
	if current_health > 0:
		_impact_bounce(hitbox)
		$AnimationPlayer.play("damaged" + facing)
		animation_locked = true
	else:
		$AnimationPlayer.play("death")
		velocity = Vector2.ZERO
		animation_locked = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		queue_free()
	animation_locked = false
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.seek(1)
		
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

func _impact_bounce(hitbox: Hitbox):
	var hitbox_position = hitbox.owning_character.position
	var bounce_direction = (self.position - hitbox_position).normalized()
	velocity = 50 * bounce_direction
