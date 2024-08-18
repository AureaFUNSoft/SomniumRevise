class_name QuitAction
extends BasicAction

func do_action(behaviour):
	super.do_action(behaviour)
	node.get_tree().quit()
	
