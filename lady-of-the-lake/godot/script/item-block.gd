class_name ItemBlock
extends DragAndDrop

export(Texture) var item_texture
export(Resource) var item

const ITEM_BLOCK_GROUP = 'item_block'

onready var item_renderer = $TextureRect
onready var collision_shape = $FillItem/CollisionShape2D
onready var fill_item = $FillItem

var _item: Item

func _ready():
	_item = item as Item
	assert(_item != null)
	fill_item.item = _item
	item_renderer.texture = item_texture
	# The size should not change in runtime
	# So run it once on ready is enough
	sync_collision_shape()
	add_to_group(ITEM_BLOCK_GROUP)

func sync_collision_shape():
	var shape = collision_shape.shape as RectangleShape2D
	assert(shape != null)
	var x = rect_size.x / 2
	var y = rect_size.y / 2
	shape.extents = Vector2(x, y)
	collision_shape.position = Vector2(x, y)
