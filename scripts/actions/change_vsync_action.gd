class_name ChangeVSyncAction
extends BasicAction

func do_action(behaviour, parameters = {}):
	super.do_action(behaviour)
	DisplayServer.window_set_vsync_mode(parameters.index)
