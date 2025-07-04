extends Node2D

func open_door():
	$ClosedSprite.visible = false
	$ClosedSprite/StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	

func _on_player_detector_area_body_entered(body: Node2D) -> void:
	print(body.inventory.contains(Global.Item.SmallKey))
	if body.inventory.contains(Global.Item.SmallKey):
		open_door()
		body.inventory.remove_item(Global.Item.SmallKey)
