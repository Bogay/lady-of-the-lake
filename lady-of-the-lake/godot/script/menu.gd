extends Node2D

const game_scene = preload('res://scenes/lake.tscn')

onready var start_btn = $Buttons/Start
onready var quit_btn = $Buttons/Quit

func _ready():
	assert(start_btn.connect('pressed', self, 'game_start') == OK)
	assert(quit_btn.connect('pressed', self, 'quit_game') == OK)

func game_start():
	get_tree().get_root().add_child(game_scene.instance())
	self.queue_free()

func quit_game():
	get_tree().quit()
