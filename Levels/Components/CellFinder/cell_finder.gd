extends Node

func get_cell_for_position(position: Vector2) -> Vector2i:
	var position_x = position.x
	var position_y = position.y
	if position_x < 0:
		position_x -= Global.MAP_CELL_SIZE.x
	if position_y < 0:
		position_y -= Global.MAP_CELL_SIZE.y
	return Vector2i(
		position_x / Global.MAP_CELL_SIZE.x,
		position_y / Global.MAP_CELL_SIZE.y,
	)