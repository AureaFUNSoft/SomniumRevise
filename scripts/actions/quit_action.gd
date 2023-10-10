class_name QuitAction
extends BasicAction

func do_action():
	if node == null:
		return
	node.get_tree().quit()
	
