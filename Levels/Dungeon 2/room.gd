class_name Room extends Node2D

func room_rect() -> Rect2i:
	# TODO: probably need (position, position + rect * 8)
	return $TileMapFloor.get_used_rect()