class_name FillItem
extends Area2D

signal item_entered(item)
signal item_exited(item)

const ITEM_TRIGGER_GROUP = 'triggered_by_item'
# Should be `Item`
export(Resource) var item

var trigger: Area2D
var _item: Item

func _ready():
	_item = item as Item
	assert(item != null)
	assert(connect('area_entered', self, '_on_area_entered') == OK)
	assert(connect('area_exited', self, '_on_area_exited') == OK)

func _on_area_entered(area: Area2D):
	print('Area entered. this=%s, other=%s' % [name, area.name])
	if not area.is_in_group(ITEM_TRIGGER_GROUP):
		return
	if trigger != null:
		return
	trigger = area
	print('Item entered. item=%s' % _item.keyword)
	emit_signal('item_entered', _item)

func _on_area_exited(area: Area2D):
	print('Area exited. this=%s, other=%s' % [name, area.name])
	if trigger == area:
		trigger = null
		print('Item exited. item=%s' % _item.keyword)
		emit_signal('item_exited', _item)
