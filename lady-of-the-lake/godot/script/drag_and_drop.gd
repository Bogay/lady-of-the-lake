# Inspired by: https://www.youtube.com/watch?v=I7QYAiSEqOo
# Thanks to endritDev - Yellow Hat Games

extends Panel

const CLICK_ACTION = 'left_click'
var dragReady = false
var originalPosition = Vector2.ZERO
var offset = Vector2.ZERO
var clickPosition = Vector2.ZERO

func _ready():
	originalPosition = get_position()

func _physics_process(_delta):
	if Input.is_action_just_pressed(CLICK_ACTION) and dragReady:
		clickPosition = get_global_mouse_position()
		offset = get_position() - clickPosition
	if Input.is_action_pressed(CLICK_ACTION) and dragReady:
		set_position(get_global_mouse_position() + offset)
	if Input.is_action_just_released(CLICK_ACTION) and dragReady:
		# TODO: emit a signal
		set_position(originalPosition)

func _on_mouse_entered():
	print('Mouse entered. node=%s' % name)
	dragReady = true

func _on_mouse_exited():
	print('Mouse exited, node=%s' % name)
	dragReady = false
