class_name ChangeSSAAAction
extends BasicAction

func do_action(behaviour):
	super.do_action(behaviour)
	BGMManager.get_viewport().screen_space_aa = parameters.index
