extends TextureRect

export(Array, Resource) var items

const ITEM_BLOCK_GROUP = 'item_block'

onready var item_description: Label = $VBoxContainer/Description/Label

var player_selection: PlayerSelection = preload('res://game_data/player-selection.tres')

func _ready():
	for item in items:
		assert(item is Item)
	assert(item_description != null)
	fill_item_blocks()
	assert(player_selection != null)
	assert(player_selection.connect('item_changed', self, '_on_item_changed') == OK)

func fill_item_blocks():
	# TODO: write `zip` utils
	var i = 0
	for item_block in get_tree().get_nodes_in_group(ITEM_BLOCK_GROUP):
		item_block.item = items[i]
		i += 1
		assert(item_block.connect('item_hovered', self, '_on_item_hovered') == OK)

func _on_item_changed(item: Item):
	if item == null:
		item_description.text = ''
	else:
		item_description.text = item.description
