class_name ShowCharacter
extends TextureRect

# Should be `PlayerSelection`
export(Resource) var player_selection

onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

func _ready():
	assert(player_selection != null)
	assert(player_selection is PlayerSelection)
	assert(collision_shape != null)

func _process(_delta):
	sync_collision_shape()

func sync_collision_shape():
	var shape = collision_shape.shape as RectangleShape2D
	assert(shape != null)
	var x = rect_size.x / 2
	var y = rect_size.y / 2
	shape.extents = Vector2(x, y)
	collision_shape.position = Vector2(x, y)
