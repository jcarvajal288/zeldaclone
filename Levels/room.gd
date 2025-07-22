class_name Room extends Node2D

var absolute_position: Vector2

func _ready() -> void:
	$TileMapWall.z_index = Global.RenderOrder.WALL
	for child in $Entrances.get_children():
		if is_instance_of(child, Entrance):
			child.player_entered.connect(bind_camera)


func contains_position(pos: Vector2) -> bool:
	return rect().has_point(pos)


func rect() -> Rect2:
	var tile_room_size = $TileMapFloor.get_used_rect().size
	var pixel_room_size = Vector2(
		tile_room_size.x * Global.MAP_TILE_SIZE,
		tile_room_size.y * Global.MAP_TILE_SIZE,
	)
	return Rect2(absolute_position, pixel_room_size)


func bind_camera():
	Global.game_controller.camera().bind_to_room(self)
