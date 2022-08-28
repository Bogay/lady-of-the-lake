class_name ClickToClose
extends Node2D

export var target: NodePath

func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		var t = get_node(target)
		t.queue_free()
		self.queue_free()
