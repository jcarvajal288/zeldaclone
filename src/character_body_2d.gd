extends CharacterBody2D

@export var speed = 50
@onready var _animated_sprite = $AnimatedSprite2D
var facing = "RightDown"

func _play_animation():
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_up"):
			_animated_sprite.play("walkRightUp")
			facing = "RightUp"
		else:
			_animated_sprite.play("walkRightDown")
			facing = "RightDown"
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_up"):
			_animated_sprite.play("walkLeftUp")
			facing = "LeftUp"
		else:
			_animated_sprite.play("walkLeftDown")
			facing = "LeftDown"
	elif Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("walkLeftUp")
			facing = "LeftUp"
		else:
			_animated_sprite.play("walkLeftDown")
			facing = "LeftDown"
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("walkLeftDown")
			facing = "LeftDown"
		else:
			_animated_sprite.play("walkRightDown")
			facing = "RightDown"
	else:
		_animated_sprite.play("idle" + facing)
	

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	_play_animation()
	
func _physics_process(delta):
	get_input()
	move_and_slide()
