extends Area2D

func _ready() -> void:
	self.set_collision_layer_value(Global.CollisionLayer.ENEMY_BOUNDARY, true)
