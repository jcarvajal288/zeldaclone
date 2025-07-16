extends AudioStreamPlayer2D

@export var owning_character: Character

func _ready():
	owning_character.on_hit.connect(_on_hit)


func _on_hit(_hitbox: Hitbox):
	play()
