class_name ChangeSceneAction
extends BasicAction

@export var scene_file: PackedScene

func do_action():
	get_tree().change_scene_to_packed(scene_file)
