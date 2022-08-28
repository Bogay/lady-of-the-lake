extends Node2D

export(NodePath) var left_btn_path
export(NodePath) var right_btn_path
export(Resource) var player_selection

var _player_selection: PlayerSelection

func _ready():
	var left_btn: BaseButton = get_node(left_btn_path)
	var right_btn: BaseButton = get_node(right_btn_path)
	assert(left_btn != null and right_btn != null)
	assert(left_btn.connect('pressed', self, '_left_pressed') == OK)
	assert(right_btn.connect('pressed', self, '_right_pressed') == OK)
	_player_selection = player_selection
	assert(_player_selection != null)

func _left_pressed():
	print('Select left')
	_player_selection.index -= 1
	_player_selection.index = (_player_selection.index + 9) % 9
	
func _right_pressed():
	print('Select right')
	_player_selection.index += 1
	_player_selection.index %= 9
