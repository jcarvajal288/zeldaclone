extends CharacterBody2D

@export var speed = 50
@export var inventory: Inventory

signal moved_to_new_map_cell(cell)

@onready var _animated_sprite = $AnimatedSprite2D

var facing = "DownRight"
var animation_locked = false

var current_map_cell = Vector2i(0, 0)

func _play_walking_animation():
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_up"):
			_animated_sprite.play("walkUpRight")
			facing = "UpRight"
		else:
			_animated_sprite.play("walkDownRight")
			facing = "DownRight"
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_up"):
			_animated_sprite.play("walkUpLeft")
			facing = "UpLeft"
		else:
			_animated_sprite.play("walkDownLeft")
			facing = "DownLeft"
	elif Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("walkUpLeft")
			facing = "UpLeft"
		else:
			_animated_sprite.play("walk" + facing)
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			_animated_sprite.play("walkDownLeft")
			facing = "DownLeft"
		else:
			_animated_sprite.play("walk" + facing)
		
func _play_attack_animation(input_direction: Vector2):
	print(input_direction)
	if facing == "DownRight":
		if input_direction.y > 0.5:
			_animated_sprite.play("attackDownRight")
		else:
			_animated_sprite.play("attackRightDown")
	elif facing == "DownLeft":
		if input_direction.y > 0.5:
			_animated_sprite.play("attackDownLeft")
		else:
			_animated_sprite.play("attackLeftDown")
	elif facing == "UpLeft":
		if input_direction.y < -0.5:
			_animated_sprite.play("attackUpLeft")
		else:
			_animated_sprite.play("attackLeftUp")
	else:
		if input_direction.y < -0.5:
			_animated_sprite.play("attackUpRight")
		else:
			_animated_sprite.play("attackRightUp")
		
		
func _set_camera_position():
	var position_x = self.position.x
	var position_y = self.position.y
	if position_x < 0:
		position_x -= Global.MAP_CELL_SIZE.x
	if position_y < 0:
		position_y -= Global.MAP_CELL_SIZE.y
	var new_map_cell = Vector2i(
		position_x / Global.MAP_CELL_SIZE.x,
		position_y / Global.MAP_CELL_SIZE.y,
	)
	if new_map_cell != current_map_cell:
		moved_to_new_map_cell.emit(new_map_cell)
		current_map_cell = new_map_cell
		
	

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var is_attacking = Input.is_action_just_pressed("action_left")
	if is_attacking:
		velocity = Vector2(0,0)
		_play_attack_animation(input_direction)
		animation_locked = true
		return
		
	if input_direction != Vector2(0,0):
		velocity = input_direction * speed
		_play_walking_animation()
	else:
		velocity = Vector2(0,0)
		_animated_sprite.play("idle" + facing)
	_set_camera_position()
	
func _physics_process(_delta):
	if not animation_locked:
		get_input()
		move_and_slide()


func _on_animation_finished() -> void:
	animation_locked = false
