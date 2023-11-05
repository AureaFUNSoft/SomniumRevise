class_name ChangeFullscreenAction
extends BasicAction

const value = {
	0: DisplayServer.WINDOW_MODE_FULLSCREEN,
	1: DisplayServer.WINDOW_MODE_WINDOWED
}

func do_action(behaviour, parameters = {}):
	super.do_action(behaviour)
	DisplayServer.window_set_mode(value[parameters.index])
