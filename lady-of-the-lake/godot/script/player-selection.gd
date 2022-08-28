class_name PlayerSelection
extends Resource

# Emitted when player selection changed
# i: the selection index
signal selection_changed(i)
signal item_changed(item)

var index = 0 setget set_index
var item: Item setget set_item

func set_index(i: int):
	index = i
	emit_signal('selection_changed', index)

func set_item(it: Item):
	item = it
	emit_signal('item_changed', item)
