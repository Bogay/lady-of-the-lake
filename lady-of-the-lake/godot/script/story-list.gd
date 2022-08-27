class_name StoryList
extends Resource

export(Array, Resource) var stories

func _ready():
	for story in stories:
		assert(story is Story)

func get_story(i: int) -> Story:
	return stories[i]

func shuffle():
	stories.shuffle()
