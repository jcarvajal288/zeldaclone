extends Camera2D

var MAP_CELL_SIZE = Vector2(160, 120)
enum DIRECTION {UP, DOWN, LEFT, RIGHT}

func _move_camera(direction):
	if direction == DIRECTION.UP:
		self.position.y -= MAP_CELL_SIZE.y
	elif direction == DIRECTION.DOWN:
		self.position.y += MAP_CELL_SIZE.y
	elif direction == DIRECTION.RIGHT:
		self.position.x += MAP_CELL_SIZE.x
	elif direction == DIRECTION.LEFT:
		self.position.x -= MAP_CELL_SIZE.x

func _process(delta: float):
	if Input.is_action_just_pressed("ui_home"):
		_move_camera(DIRECTION.UP)
	elif Input.is_action_just_pressed("ui_end"):
		_move_camera(DIRECTION.DOWN)
