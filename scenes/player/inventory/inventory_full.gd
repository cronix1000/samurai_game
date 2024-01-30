extends ProgressBar

var Inventory : Inventory
var slots
var columns
var max_inv_space : float = 20

func _ready():
	await "process_frame"
	Inventory = inventory
	display_percent()
	#position = (get_viewport_rect().size - get_rect().size) /2


func display_percent():
	var cols = Inventory.cols
	var rows = Inventory.rows
	slots = cols* rows
	var total : float = 0 
	for index in range(slots):
		var quant = Inventory.items_quant[index]
		total += quant
	value = (total/max_inv_space ) * 100
	if(!Inventory.is_connected("items_changed", Callable(self, "_on_inventory_items_changed"))):
		Inventory.connect("items_changed", Callable(self, "_on_inventory_items_changed"))
	
func _on_inventory_items_changed(indexes):
	display_percent()
		
