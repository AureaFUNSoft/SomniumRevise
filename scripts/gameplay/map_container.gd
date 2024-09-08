class_name MapContainer
extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var action_callable = Callable(self, "_change_map")
	Gameplay.connect("change_map_requested",action_callable)
	_change_map()

func _change_map():
	for child in get_children():
		child.queue_free()
	var map = load(Gameplay.current_map)
	var instance = map.instantiate()
	add_child(instance)
	move_child(instance,0)
	Gameplay.emit_signal("change_map_completed")
