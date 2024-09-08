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
