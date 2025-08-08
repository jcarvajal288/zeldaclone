class_name Hurtbox extends Area2D

@export var owning_character: CharacterBody2D

signal on_hit


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(hitbox: Area2D) -> void:
	if not hitbox is Hitbox:
		return
	if owning_character == null:
		return
	if hitbox.owning_character.alignment == owning_character.alignment:
		return
	on_hit.emit(hitbox)


func set_disabled(state: bool):
	$CollisionShape2D.set_deferred("disabled", state)
