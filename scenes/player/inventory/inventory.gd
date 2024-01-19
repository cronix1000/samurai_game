extends Node
class_name Inventory

signal items_changed(indexes: Array[int])
var cols = 8
var rows = 1
var slots = cols * rows
var items = []

func _ready():
	for i in range(slots):
		items.append(null)
	items[0] = GameManager.get_item_by_key("tomato")

func set_item(index, item):
	var previous_item = items[index]
	items[index] = item
	emit_signal("items_changed", [index])
	return previous_item

func remove_item(index):
	var previous_item = items[index].duplicate()
	items[index].clear()
	emit_signal("items_changed", [index])
	return previous_item

func set_item_quantity(index, amount):
	items[index].quantity += amount
	if items[index].quantity <= 0:
		remove_item(index)
	else:
		emit_signal("items_changed", [index])
