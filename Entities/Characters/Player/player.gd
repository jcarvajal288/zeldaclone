extends Character

@export var inventory: Inventory

signal moved_to_new_map_cell(cell)

@onready var animation_player = $AnimationPlayer

var current_map_cell = Vector2i.ZERO

func _init():
	var spd = 50
	super(spd)
	alignment = Global.Alignment.GOOD

		
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
		
	

	
func _physics_process(_delta):
	if not $AnimationPlayer.animation_locked:
		$InputController.get_input()
		_set_camera_position()
	move_and_slide()
