class_name ShowCharacter
extends TextureRect

# Should be `PlayerSelection`
export(Resource) var player_selection

onready var collisionShape: CollisionShape2D = $Area2D/CollisionShape2D

func _ready():
	assert(player_selection != null)
	assert(player_selection is PlayerSelection)
	assert(collisionShape != null)

func _on_resized():
	if collisionShape == null:
		return
	print('resized')
	var shape: RectangleShape2D = collisionShape.shape
	shape.extents = rect_size
