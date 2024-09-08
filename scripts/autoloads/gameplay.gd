extends Node

const gameplay_scene = "res://scenes/gameplay.tscn"

signal change_map_requested()
signal change_map_completed()

var _is_gameplay_scene = false

var current_map: String
var spawn_index: int

func change_map(map, spawn):
	current_map = map
	spawn_index = spawn
	emit_signal("change_map_requested")
	if not _is_gameplay_scene:
		get_tree().change_scene_to_file(gameplay_scene)
		_is_gameplay_scene = true

func get_spawn_pos_node():
	var spawn_pos_container:Node3D = get_tree().get_first_node_in_group("SpawnPoint")
	if spawn_pos_container.get_child_count() < spawn_index:
		printerr("Current map doesn't have spawn point index %s" %spawn_index)
	var spawn_point:Node3D = spawn_pos_container.get_child(spawn_index)
	return spawn_point
