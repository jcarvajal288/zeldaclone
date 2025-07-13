extends Node2D

# @export var player_health: Health
@export var heart_scene = preload("res://UI/HUD/ui_heart.tscn")

func _ready() -> void:
	Global.player_health_changed.connect(change_health_bar)


func change_health_bar(current_health: int):
	erase_old_health_bar()
	draw_health_bar(current_health)


func erase_old_health_bar():
	for child in get_children():
		if is_instance_of(child, UIHeart):
			child.queue_free()


func draw_health_bar(current_health: int):
	print("draw_health_bar")
	var rightmost_heart_position = Vector2(146, 4)
	var num_hearts = current_health / 4
	#var num_heart_fragments = current_health % 4
	for n in num_hearts:
		var heart_position_x = rightmost_heart_position.x - 8 * n
		var heart = heart_scene.instantiate()
		heart.position = Vector2(heart_position_x, rightmost_heart_position.y)
		add_child(heart)
