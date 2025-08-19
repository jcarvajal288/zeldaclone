class_name BonfireRegistry extends Object


class BonfireRecord:
	var spawn_point: Vector2
	var host_level: PackedScene

	func _init(s, h) -> void:
		self.spawn_point = s
		self.host_level = h


var active_bonfire = ""
var registry = {}


func register_bonfire(name: String, spawn: Vector2, level: PackedScene) -> void:
	registry[name] = BonfireRecord.new(spawn, level)


func get_active_bonfire() -> BonfireRecord:
	return registry[active_bonfire]
