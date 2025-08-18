class_name BonfireRegistry extends Object


class BonfireRecord:
	var spawn_point: Vector2
	var host_level: PackedScene
	var is_lit: bool

	func _init(s, h, l) -> void:
		self.spawn_point = s
		self.host_level = h
		self. is_lit = l


var active_bonfire = 0
var registry = []


func register_bonfire(spawn: Vector2, level: PackedScene, lit: bool) -> void:
	registry.append(BonfireRecord.new(spawn, level, lit))


func get_active_bonfire() -> BonfireRecord:
	return registry[active_bonfire]