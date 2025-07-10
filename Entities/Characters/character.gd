class_name Character extends CharacterBody2D

var alignment = Global.Alignment.EVIL
var facing = "DownRight"
var speed = 1

var animation_locked = false

func _init(spd):
	speed = spd
	
func play_animation(animation_name, should_lock):
	$AnimationPlayer.play(animation_name)
	animation_locked = should_lock


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		queue_free()
	animation_locked = false
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.seek(1)
	
func _impact_bounce(hitbox: Hitbox):
	var hitbox_position = hitbox.owning_character.position
	var bounce_direction = (self.position - hitbox_position).normalized()
	velocity = 50 * bounce_direction
