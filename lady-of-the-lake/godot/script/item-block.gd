class_name ItemBlock
extends DragAndDrop

signal item_hovered(item)

export(Resource) var item

const ITEM_BLOCK_GROUP = 'item_block'

onready var item_renderer = $TextureRect
onready var collision_shape = $FillItem/CollisionShape2D
onready var fill_item = $FillItem

var _item: Item
var player_selection: PlayerSelection = preload('res://game_data/player-selection.tres')

func _ready():
	_item = item as Item
	assert(_item != null)
	fill_item.item = _item
	item_renderer.texture = _item.texture
	# The size should not change in runtime
	# So run it once on ready is enough
	sync_collision_shape()
	add_to_group(ITEM_BLOCK_GROUP)
	assert(connect('dropped', self, '_on_item_dropped') == OK)
	assert(connect('mouse_entered', self, '_on_item_hovered') == OK)
	assert(connect('mouse_exited', self, '_on_item_unhovered') == OK)

func sync_collision_shape():
	var shape = collision_shape.shape as RectangleShape2D
	assert(shape != null)
	var x = rect_size.x / 2
	var y = rect_size.y / 2
	shape.extents = Vector2(x, y)
	collision_shape.position = Vector2(x, y)

func _on_item_dropped():
	if fill_item.trigger == null:
		return
	# TODO: combine item and trigger, play story
	print('Trigger. item=%s, trigger=%s' % [_item.keyword, fill_item.trigger.name])

func _on_item_hovered():
	print('Item hovered. item=%s' % _item.keyword)
	player_selection.item = _item

func _on_item_unhovered():
	print('Item unhovered. item=%s' % _item.keyword)
	player_selection.item = null
