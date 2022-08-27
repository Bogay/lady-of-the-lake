extends NinePatchRect

export(Resource) var player_selection
export(Resource) var stories
onready var text: Label = $Text

var _player_selection: PlayerSelection
var _stories: StoryList

func _ready():
	_player_selection = player_selection
	assert(_player_selection != null)
	_stories = stories
	assert(_stories != null)
	assert(text != null)
	assert(_player_selection.connect(
		'selection_changed',
		self,
		'_on_player_selection_changed'
	) == OK)
	_on_player_selection_changed(_player_selection.index)

func _on_player_selection_changed(index: int):
	var story = _stories.get_story(index)
	assert(story != null)
	text.text = story.description.replace('{{}}', ' ___ ')
