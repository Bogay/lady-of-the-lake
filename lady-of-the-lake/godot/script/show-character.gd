class_name ShowCharacter
extends TextureRect

# Should be `PlayerSelection`
export(Resource) var player_selection
export(Resource) var stories

onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

var _player_selection: PlayerSelection
var _stories: StoryList

func _ready():
	_player_selection = player_selection
	assert(_player_selection != null)
	_stories = stories
	assert(collision_shape != null)

	# TODO: move this to somewhere belong to `StoryList`
	randomize()
	stories.shuffle()

	assert(_player_selection.connect(
		'selection_changed',
		self,
		'_on_player_selection_changed'
	) == OK)
	_on_player_selection_changed(_player_selection.index)

func _on_player_selection_changed(index: int):
	var story = _stories.get_story(index)
	assert(story != null)
	texture = story.character_sprite
	sync_collision_shape()

func sync_collision_shape():
	var shape = collision_shape.shape as RectangleShape2D
	assert(shape != null)
	var x = rect_size.x / 2
	var y = rect_size.y / 2
	shape.extents = Vector2(x, y)
	collision_shape.position = Vector2(x, y)
