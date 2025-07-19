class_name Entrance extends Area2D

signal player_entered

func _ready() -> void:
	self.set_collision_layer_value(Global.CollisionLayer.ENEMY_BOUNDARY, true)
	self.set_collision_mask_value(Global.CollisionLayer.PLAYER, true)
	self.body_entered.connect(player_detected)


func player_detected(_player: Player):
	player_entered.emit()