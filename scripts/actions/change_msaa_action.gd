class_name ChangeMSAAAction
extends BasicAction

func do_action(behaviour):
	super.do_action(behaviour)
	BGMManager.get_viewport().msaa_3d = parameters.index
