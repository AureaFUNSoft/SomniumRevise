extends Node

@export var min_blink_interval:float = 2
@export var max_blink_interval:float = 6
@export var blink_shape_key:String

var _timer

# Called when the node enters the scene tree for the first time.
func _ready():
	if not get_parent() is MeshInstance3D or get_parent().get("blend_shapes/%s" %blink_shape_key) == null:
		queue_free()
	
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.timeout.connect(_on_blink)
	_timer.one_shot = true
	_on_blink()

func _on_blink():
	#get_parent().set("blend_shapes/%s" %blink_shape_key, )
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(), "blend_shapes/%s" %blink_shape_key, 1, 0.2).set_trans(Tween.TRANS_SINE)
	tween.tween_property(get_parent(), "blend_shapes/%s" %blink_shape_key, 0, 0.2).set_trans(Tween.TRANS_SINE)
	_timer.wait_time = randf_range(min_blink_interval,max_blink_interval)
	_timer.start()
