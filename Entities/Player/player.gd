extends CharacterBody2D

@export var speed = 50
@export var inventory: Inventory

signal moved_to_new_map_cell(cell)

@onready var _animated_sprite = $AnimatedSprite2D

var facing = "DownRight"

var current_map_cell = Vector2i(0, 0)

func _play_animation():
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
	else:
		_animated_sprite.play("idle" + facing)
		
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
	velocity = input_direction * speed
	_play_animation()
	_set_camera_position()
	
func _physics_process(delta):
	get_input()
	move_and_slide()
