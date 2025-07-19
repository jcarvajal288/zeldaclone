class_name Room extends Node2D


func contains_position(room_position: Vector2, pos: Vector2) -> bool:
	var tile_room_size = $TileMapFloor.get_used_rect().size
	var pixel_room_size = Vector2(
		tile_room_size.x * Global.MAP_TILE_SIZE,
		tile_room_size.y * Global.MAP_TILE_SIZE,
	)
	var absolute_rect = Rect2(room_position, pixel_room_size)
	return absolute_rect.has_point(pos)
