extends Camera2D

		
func move_camera_to_cell(cell):
	self.position = Vector2(
		GlobalConstants.MAP_CELL_SIZE.x * cell.x,
		GlobalConstants.MAP_CELL_SIZE.y * cell.y,
	)
