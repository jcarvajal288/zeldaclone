extends CharacterBody2D


func _on_hurtbox_area_entered(area: Area2D) -> void:
	queue_free()
