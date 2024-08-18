class_name OptionList
extends Resource

@export_group("Action Parameter")
@export var action:BasicAction

var _list = []
var _default_index = 0

func get_list():
	return _list

func get_default_index():
	return _default_index

func select(index):
	if action != null:
		var params = {
			"index": index,
			"value": _list[index]
		}
		action.set_parameter(params)
		action.do_action(self)
