extends CharacterBody2D


func _on_hurtbox_area_entered(area: Hitbox) -> void:
	queue_free()
