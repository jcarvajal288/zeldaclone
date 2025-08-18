class_name BonfireRegistry extends Object


class BonfireRecord:
	var name: String
	var spawn_point: Vector2
	var host_level: PackedScene

	func _init(n, s, h) -> void:
		self.name = n
		self.spawn_point = s
		self.host_level = h


var active_bonfire = 0
var registry = []


func register_bonfire(name: String, spawn: Vector2, level: PackedScene) -> void:
	registry.append(BonfireRecord.new(name, spawn, level))


func get_active_bonfire() -> BonfireRecord:
	return registry[active_bonfire]