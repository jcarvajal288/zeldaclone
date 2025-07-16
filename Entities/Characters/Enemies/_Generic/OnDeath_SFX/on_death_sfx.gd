extends AudioStreamPlayer2D

@export var owning_character: Character

func _ready():
	owning_character.Health.died_signal.connect(_on_death)


func _on_death(_hitbox: Hitbox):
	play()
