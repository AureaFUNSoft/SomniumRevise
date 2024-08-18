class_name ChangeFPSAction
extends BasicAction

func do_action(behaviour):
	super.do_action(behaviour)
	print("Change FPS to %s" %int(parameters.value))
	Engine.max_fps = int(parameters.value)
