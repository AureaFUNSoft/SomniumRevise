class_name ChangeSceneAction
extends BasicAction

@export_group("Scene")
@export var scene_file: String

func do_action(behaviour, parameters = {}):
	super.do_action(behaviour)
	#node.get_tree().change_scene_to_packed(scene_file)
	node.get_tree().change_scene_to_file(scene_file)
	
