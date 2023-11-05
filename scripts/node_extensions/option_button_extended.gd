class_name OptionButtonExtended
extends OptionButton

signal text_selected(text)
signal text_int_selected(text_int)

@export_group("Custom Option")
@export var option_list:OptionList
@export var self_action:bool = true

var list_initialized = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_custom_list()
	var action_callable = Callable(self, "_item_selected")
	connect("item_selected", action_callable)

func _item_selected(index):
	if self_action:
		select_override(index)
	var selected_text = get_item_text(index)
	emit_signal("text_selected",selected_text)
	emit_signal("text_int_selected",int(selected_text))

func _init_custom_list():
	if option_list == null or list_initialized:
		return
	
	list_initialized = true
	clear()
	var list = option_list.get_list()
	for member in list:
		add_item(str(member))
	
	select_override(option_list.get_default_index())

func get_selected_text():
	return get_item_text(selected)

func select_override(value):
	option_list.select(value)
	select(value)

func select_text(value):
	_init_custom_list()
	var index = 0
	for i in get_item_count():
		if get_item_text(i) == str(value):
			index = i
			break
	select_override(index)

func select_value(value):
	_init_custom_list()
	select_override(int(value))
