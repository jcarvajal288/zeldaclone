class_name Character extends CharacterBody2D

var alignment = Global.Alignment.GOOD
var speed = 1

func _init(spd):
	speed = spd

	
func take_pit_damage():
	$Health.take_damage(1)


func fall_down_pit(fall_point: Vector2):
	$AnimationPlayer.animation_locked = true
	$AnimationPlayer.play_fall_animation()
	var fall_direction = (self.position -fall_point).normalized()
	self.velocity = fall_direction * 20