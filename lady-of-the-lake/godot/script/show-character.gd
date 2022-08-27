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
	randomize()
	stories.shuffle()

func _process(_delta):
	var story = _stories.get_story(player_selection.index)
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
