class_name Character extends CharacterBody2D

var alignment = Global.Alignment.GOOD
var speed = 1
@onready var animation_player = $AnimationPlayer
@onready var health = $Health

func _init(spd):
	speed = spd

