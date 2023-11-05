class_name GenericList
extends OptionList

@export_group("Generic List")
@export var lists:Array
@export var default_index:int

func get_list():
	for value in lists:
		_list.append(str(value))
	
	return _list

func get_default_index():
	_default_index = default_index
	return _default_index
