extends Camera2D

var current_room: Room
		
func move_camera_to_cell(cell):
	self.position = Vector2(
		Global.MAP_CELL_SIZE.x * cell.x,
		Global.MAP_CELL_SIZE.y * cell.y,
	)


func bind_to_room(room: Room):
	current_room = room
	var room_rect: Rect2 = room.rect()
	self.limit_top = int(room_rect.position.y)
	self.limit_bottom = int(room_rect.end.y)
	self.limit_left = int(room_rect.position.x)
	self.limit_right = int(room_rect.end.x)
	self.position = room.absolute_position