class_name Bonfire extends StaticBody2D

@export var bonfire_name: String

func _ready() -> void:
	set_light()
	$LabelShowArea.body_entered.connect(turn_label_on)
	$LabelShowArea.body_exited.connect(turn_label_off)
	$ActionLabel.visible = false


func get_spawn_point() -> Vector2:
	return $SpawnPoint.global_position


func is_active_bonfire() -> bool:
	if Global.bonfire_registry == null:
		return true # this is the first bonfire
	return bonfire_name == Global.bonfire_registry.get_active_bonfire().name


func set_light() -> void:
	if is_active_bonfire():
		$Base.play("lit")
		$Flame.visible = true
		$Glow.visible = true
	else:
		$Base.play("unlit")
		$Flame.visible = false
		$Glow.visible = false


func turn_label_on(body: Node2D) -> void:
	if body is Player and not self.is_active_bonfire():
		$ActionLabel.visible = true


func turn_label_off(body: Node2D) -> void:
	if body is Player:
		$ActionLabel.visible = false