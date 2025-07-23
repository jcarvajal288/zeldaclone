class_name Character extends CharacterBody2D

var alignment = Global.Alignment.GOOD
var speed = 1

func _init(spd):
	speed = spd

	
func take_pit_damage():
	$Health.take_damage(1)


func fall_down_pit(fall_direction: Vector2):
	$AnimationPlayer.play_fall_animation()
	self.velocity = fall_direction * 20