class_name ResultStory
extends Control

export(Resource) var item
export(Resource) var expected_item

onready var item_renderer: TextureRect = $Item
onready var description_label: Label = $Description/MarginContainer/Label

var _item: Item

func _ready():
	_item = item
	assert(_item != null)
	item_renderer.texture = _item.texture
	description_label.text = description_label.text.replace('__', _item.keyword)

func _process(_delta):
	if Input.is_action_just_pressed("left_click"):
		if item == expected_item:
			var success_scene = preload('res://scenes/rate/success.tscn')
			get_tree().get_root().add_child(success_scene.instance())
		else:
			var success_scene = preload('res://scenes/rate/fail.tscn')
			get_tree().get_root().add_child(success_scene.instance())
		self.queue_free()
