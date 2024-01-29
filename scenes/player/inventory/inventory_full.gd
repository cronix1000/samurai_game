extends ProgressBar

var Inventory : Inventory
var slots
var columns
var max_inv_space = 20

func _ready():
	await "process_frame"
	Inventory = inventory
	display_percent(Inventory.cols, Inventory.rows)
	#position = (get_viewport_rect().size - get_rect().size) /2


func display_percent(cols,rows):
	columns = cols
	slots = cols* rows
	var total = 0
	for index in range(slots):
		var quant = Inventory.items_quant[index]
		total += quant
	value = (total/max_inv_space )* 100
	Inventory.connect("items_changed", Callable(self, "_on_inventory_items_changed"))
	
func _on_inventory_items_changed(indexes):
	item_slot.display_percent()
		
