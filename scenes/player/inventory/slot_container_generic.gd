extends GridContainer
class_name slot_container_generic

@export var ItemSlot : PackedScene

var Inventory : Inventory
var slots

func _ready():
	await "process_frame"
	Inventory = inventory
	display_item_slots(Inventory.cols, Inventory.rows)
	#position = (get_viewport_rect().size - get_rect().size) /2


func display_item_slots(cols,rows):
	columns = cols
	slots = cols* rows
	for index in range(5):
		var item_slot = ItemSlot.instantiate()
		add_child(item_slot)
		item_slot.display_item(Inventory.items[index])
	Inventory.connect("items_changed", Callable(self, "_on_inventory_items_changed"))
	
func _on_inventory_items_changed(indexes):
	for index in indexes:
		if index < slots:
			var item_slot = get_child(index)
			item_slot.display_item(Inventory.items[index])
		
