extends Camera2D

		
func move_camera_to_cell(cell):
	self.position = Vector2(
		Global.MAP_CELL_SIZE.x * cell.x,
		Global.MAP_CELL_SIZE.y * cell.y,
	)
