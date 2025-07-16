extends Area2D

@export var owning_character: CharacterBody2D


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(hitbox: Hitbox) -> void:
	if owning_character == null:
		return
	if hitbox.owning_character.alignment == owning_character.alignment:
		return
	owning_character.on_hit.emit(hitbox)
