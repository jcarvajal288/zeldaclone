extends Camera2D

var current_room: Room
		
func center_camera_on_position(pos):
	var viewport_size = get_viewport_rect().size
	self.position = Vector2(
		pos.x - viewport_size.x / 2.0,
		pos.y - viewport_size.y / 2.0,
	)


func bind_to_room(room: Room):
	current_room = room
	var room_rect: Rect2 = room.rect()
	self.limit_top = int(room_rect.position.y)
	self.limit_bottom = int(room_rect.end.y)
	self.limit_left = int(room_rect.position.x)
	self.limit_right = int(room_rect.end.x)
	self.position = room.absolute_position
