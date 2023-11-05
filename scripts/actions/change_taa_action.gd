class_name ChangeTAAAction
extends BasicAction

func do_action(behaviour, parameters = {}):
	super.do_action(behaviour)
	BGMManager.get_viewport().use_taa = bool(parameters.index)
