extends AudioStreamPlayer2D

@export var owning_character: Character


func _on_hit(_hitbox: Hitbox):
	play()
