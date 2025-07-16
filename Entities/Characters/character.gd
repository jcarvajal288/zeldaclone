class_name Character extends CharacterBody2D

var alignment = Global.Alignment.GOOD
var speed = 1

var health = null

signal on_hit


func _init(spd):
	speed = spd


func _ready() -> void:
	health = $Health
	
