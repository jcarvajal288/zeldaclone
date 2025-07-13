class_name Player extends Character

@export var inventory: Inventory

signal moved_to_new_map_cell(cell)

@onready var animation_player = $AnimationPlayer

var current_map_cell = Vector2i.ZERO

func _init():
	var spd = 50
	super(spd)
	alignment = Global.Alignment.GOOD

		
func _set_camera_position():
	var new_map_cell = $CellFinder.get_cell_for_position(self.position)
	if new_map_cell != current_map_cell:
		moved_to_new_map_cell.emit(new_map_cell)
		current_map_cell = new_map_cell
		
	
func _physics_process(_delta):
	if not $AnimationPlayer.animation_locked:
		$InputController.get_input()
		_set_camera_position()
	move_and_slide()
	Global.PLAYER_POSITION = self.position
