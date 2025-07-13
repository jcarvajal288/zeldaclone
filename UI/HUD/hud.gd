extends Node2D

# @export var player_health: Health
@export var heart_scene = preload("res://UI/HUD/ui_heart.tscn")

func _ready() -> void:
	Global.health_changed.connect(draw_health_bar)

func draw_health_bar(current_health: int):
	var rightmost_heart_position = Vector2(146, 4)
	var num_hearts = current_health / 4
	#var num_heart_fragments = current_health % 4
	for n in num_hearts:
		print("drawing heart")
		var heart_position_x = rightmost_heart_position.x - 8 * n
		var heart = heart_scene.instantiate()
		heart.position = Vector2(heart_position_x, rightmost_heart_position.y)
		add_child(heart)
