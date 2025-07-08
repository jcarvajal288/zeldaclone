extends CharacterBody2D

@export var speed = 50
@export var inventory: Inventory

signal moved_to_new_map_cell(cell)

@onready var animation_player = $AnimationPlayer

var facing = "DownRight"
var animation_locked = false

var current_map_cell = Vector2i.ZERO

func _play_walking_animation():
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_up"):
			animation_player.play("walkUpRight")
			facing = "UpRight"
		else:
			animation_player.play("walkDownRight")
			facing = "DownRight"
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_up"):
			animation_player.play("walkUpLeft")
			facing = "UpLeft"
		else:
			animation_player.play("walkDownLeft")
			facing = "DownLeft"
	elif Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_left"):
			animation_player.play("walkUpLeft")
			facing = "UpLeft"
		else:
			animation_player.play("walk" + facing)
			facing = facing.replace("Down", "Up")
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			animation_player.play("walkDownLeft")
			facing = "DownLeft"
		else:
			animation_player.play("walk" + facing)
			facing = facing.replace("Up", "Down")
		
func _play_attack_animation(input_direction: Vector2):
	if input_direction == Vector2(0, -1):
		if facing.contains("Left"):
			animation_player.play("attackUpSlashLeft")
		else:
			animation_player.play("attackUpSlashRight")
	elif input_direction == Vector2(0, 1):
		if facing.contains("Left"):
			animation_player.play("attackDownSlashLeft")
		else:
			animation_player.play("attackDownSlashRight")
	elif input_direction == Vector2(-1, 0):
		if facing.contains("Up"):
			animation_player.play("attackUpSlashLeft")
		else:
			animation_player.play("attackDownLeft")
	elif input_direction == Vector2(1, 0):
		if facing.contains("Up"):
			animation_player.play("attackUpRight")
		else:
			animation_player.play("attackDownRight")
	else: 
		animation_player.play("attack" + facing)
		
		
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
		velocity = Vector2.ZERO
		_play_attack_animation(input_direction)
		animation_locked = true
		return
		
	if input_direction != Vector2.ZERO:
		velocity = input_direction * speed
		_play_walking_animation()
	else:
		velocity = Vector2.ZERO
		animation_player.play("idle" + facing)
	_set_camera_position()
	
func _physics_process(_delta):
	if not animation_locked:
		get_input()
		move_and_slide()


func _on_animation_finished(anim_name) -> void:
	animation_locked = false
