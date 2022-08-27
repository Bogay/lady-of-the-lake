class_name ItemBlock
extends DragAndDrop

export(Texture) var item_texture
export(Resource) var item

onready var item_renderer = $TextureRect
onready var collision_shape = $Area2D/CollisionShape2D

var _item: Item

func _ready():
	_item = item as Item
	assert(_item != null)
	item_renderer.texture = item_texture
	# The size should not change in runtime
	# So run it once on ready is enough
	sync_collision_shape()	

func sync_collision_shape():
	var shape = collision_shape.shape as RectangleShape2D
	assert(shape != null)
	var x = rect_size.x / 2
	var y = rect_size.y / 2
	shape.extents = Vector2(x, y)
	collision_shape.position = Vector2(x, y)
