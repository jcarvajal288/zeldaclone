extends Node2D

# @export var player_health: Health
@export var heart_scene = preload("res://UI/HUD/Heart/ui_heart.tscn")

func _ready() -> void:
	Global.player_health_changed.connect(change_health_bar)


func change_health_bar(current_health: int, max_health: int):
	erase_old_health_bar()
	draw_health_bar(current_health, max_health)


func erase_old_health_bar():
	for child in get_children():
		if is_instance_of(child, UIHeart):
			child.queue_free()


func draw_health_bar(current_health: int, max_health: int):
	var rightmost_heart_position = Vector2(146, 4)
	var num_filled_hearts = current_health / 4
	var num_empty_hearts = max_health / 4 - num_filled_hearts
	var num_heart_fragments = current_health % 4
	if num_heart_fragments > 0:
		num_empty_hearts -= 1
	var heart_position_x = rightmost_heart_position.x
	for n in num_empty_hearts:
		var new_heart_position_x = heart_position_x - 8
		var heart = heart_scene.instantiate()
		heart.position = Vector2(new_heart_position_x, rightmost_heart_position.y)
		heart.set_as_empty_heart()
		add_child(heart)
		heart_position_x = new_heart_position_x
	if num_heart_fragments != 0:
		var new_heart_position_x = heart_position_x - 8
		var heart = heart_scene.instantiate()
		heart.set_as_fragment(num_heart_fragments)
		heart.position = Vector2(new_heart_position_x, rightmost_heart_position.y)
		add_child(heart)
		heart_position_x = new_heart_position_x
	for n in num_filled_hearts:
		var new_heart_position_x = heart_position_x - 8
		var heart = heart_scene.instantiate()
		heart.position = Vector2(new_heart_position_x, rightmost_heart_position.y)
		add_child(heart)
		heart_position_x = new_heart_position_x
