class_name ChangeMapAction
extends BasicAction

@export_group("Scene")
@export_file("*.tscn") var scene_file
@export var spawn_index: int

func do_action(behaviour):
	super.do_action(behaviour)
	Gameplay.change_map(scene_file, spawn_index)
