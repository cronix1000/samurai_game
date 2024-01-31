extends Node
class_name Inventory

signal items_changed(indexes: Array[int])
var cols = 8
var rows = 1
var slots = cols * rows
var items = []
var items_quant = []

func _ready():
	for i in range(slots):
		items.append(null)
	for i in range(slots):
		items_quant.append(0)

	items[0] = GameManager.get_item_by_key("tomato")
	items_quant[0] = 5
	#emit_signal("items_changed", [0])

func set_item(index, item):
	var previous_item = items[index]
	items[index] = item
	emit_signal("items_changed", [index])
	return previous_item

func add_item(item):
	var index = items.find(null)
	if(items.find(item) != -1):
		set_item_quantity(items.find(item), 1)
	else:
		items[index] = item
		set_item_quantity(items.find(item), 1)
	emit_signal("items_changed", [index])

func remove_item(index):
	var previous_item = items[index].duplicate()
	items[index] = null
	emit_signal("items_changed", [index])
	return previous_item

func set_item_quantity(index, amount):
	items_quant[index] += amount 
	if items_quant[index] <= 0:
		items_quant[index] = 0
		remove_item(index)
	else:
		emit_signal("items_changed", [index])

func check_inv_for_item_quant(item, quantity):
	if items.has(item):
		if(items_quant[items.find(item)] >=quantity):
			return true
	

func get_list_of_items():
	var items_list = []
	for item in items:
		if item:
			for item_q in item["quantity"]:
				items_list.append(item)
	return items_list
