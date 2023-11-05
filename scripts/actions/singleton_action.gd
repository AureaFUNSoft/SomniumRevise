class_name SingletonAction
extends BasicAction

@export_group("Action")
@export var singleton_name: String
@export var singleton_child: String
@export var singleton_method: String
@export var args: Array

func do_action(behaviour, parameters = {}):
	super.do_action(behaviour)
	var singleton = node.get_node("/root/%s" %singleton_name)
	
	if singleton != null:
		if not singleton_child.is_empty():
			var s_child = singleton.get_node(singleton_child)
			
			if s_child != null:
				singleton = s_child
		
		if args == null or args.size() == 0:
			singleton.call(singleton_method)
		else:
			singleton.callv(singleton_method,args)
	
