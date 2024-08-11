class_name ViewportBlurCapture
extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	var action_callable = Callable(self, "_visibility_changed")
	connect("visibility_changed", action_callable)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _visibility_changed():
	print("%s visibility %s" %[name,is_visible_in_tree()])
	if is_visible_in_tree():
		var sc_node = self
		if not get_tree().get_nodes_in_group("Game").is_empty():
			sc_node = get_tree().get_nodes_in_group("Game")[0]
			print("sc node is %s" %[sc_node.name])
		await get_tree().process_frame
		await get_tree().process_frame
		var image = sc_node.get_viewport().get_texture().get_image()
		var image_size = image.get_size()
		var image_format = image.get_format()
		print("sc size is %s" %[image_size])
		var sc_image = Image.create_from_data(image_size.x, image_size.y, false, image_format, image.get_data())
		sc_image.shrink_x2()
		sc_image.shrink_x2()
		sc_image.shrink_x2()
		var image_texture = ImageTexture.create_from_image(sc_image)
		texture = image_texture
	else:
		texture = null
