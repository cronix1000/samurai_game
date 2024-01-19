extends TextureRect
class_name item_slot


@onready var item_quantity = $item_quantity
@onready var item_icon = $item_icon
var inventory : Inventory
var local_item

func _ready():
	inventory = get_parent().Inventory

func display_item(item):
	if item:
		item_icon.texture = load("res://items/%s" % item.icon)
		item_quantity.text = str(item.quantity) if item.stackable else ""
	else:
		item_icon.texture = null
		item_quantity.text = ""

