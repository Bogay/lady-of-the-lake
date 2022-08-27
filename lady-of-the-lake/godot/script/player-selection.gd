class_name PlayerSelection
extends Resource

# Emitted when player selection changed
# i: the selection index
signal selection_changed(i)

var index = 0 setget set_index

func set_index(i: int):
	index = i
	emit_signal('selection_changed', index)
