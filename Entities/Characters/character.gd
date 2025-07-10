class_name Character extends CharacterBody2D

var alignment = Global.Alignment.EVIL
var facing = "DownRight"
var max_health = 1
var current_health = max_health
var speed = 1

var animation_locked = false

func _init(hp, spd):
	max_health = hp
	current_health = max_health
	speed = spd

func _on_hurtbox_area_entered(hitbox: Hitbox) -> void:
	if hitbox.alignment == alignment:
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
	
func _impact_bounce(hitbox: Hitbox):
	var hitbox_position = hitbox.owning_character.position
	var bounce_direction = (self.position - hitbox_position).normalized()
	velocity = 50 * bounce_direction
