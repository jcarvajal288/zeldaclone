class_name Character extends CharacterBody2D

var alignment = Global.Alignment.GOOD
var speed = 1

signal on_hit

func _init(spd):
	speed = spd

	
