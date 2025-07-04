extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.inventory.add_item(Global.Item.SmallKey)
	self.get_parent().queue_free()
