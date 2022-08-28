class_name ResultStory
extends Control

export(Resource) var item

onready var item_renderer: TextureRect = $Item
onready var description_label: Label = $Description/MarginContainer/Label

var _item: Item

func _ready():
	_item = item
	assert(_item != null)
	item_renderer.texture = _item.texture
	description_label.text = description_label.text.replace('__', _item.keyword)
