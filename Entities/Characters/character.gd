class_name Character extends CharacterBody2D

var alignment = Global.Alignment.GOOD
var speed = 1

func _init(spd):
	speed = spd

	
func take_pit_damage():
	$Health.take_damage(1)