class_name UIHeart extends Node2D

func set_as_empty_heart():
	$Sprite2D.region_rect = Rect2(32, 0, 8, 8)


func set_as_fragment(num: int):
	$Sprite2D.region_rect = Rect2(8 * num, 0, 8, 8)