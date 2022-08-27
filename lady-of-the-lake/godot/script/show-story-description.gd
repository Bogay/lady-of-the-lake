extends NinePatchRect

export(Resource) var player_selection
export(Resource) var stories
onready var text: Label = $Text

var _player_selection: PlayerSelection
var _stories: StoryList
var prev_story: Story

func _ready():
	_player_selection = player_selection
	assert(_player_selection != null)
	_stories = stories
	assert(_stories != null)
	assert(text != null)
	
func _process(_delta):
	# TODO: use signal
	var story = _stories.get_story(_player_selection.index)
	assert(story != null)
	if story == prev_story:
		return
	text.text = story.description.replace('{{}}', ' ___ ')
	prev_story = story
