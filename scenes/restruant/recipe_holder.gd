extends Control
class_name recipe_holder


@onready var description = $description
@onready var recipe_icon = $recipe
var inventory : Inventory

func display_item(item):
	if item:
		recipe_icon.texture = load("res://recipes/%s" % item.icon)
		description.text = str(item.quantity) if item.stackable else ""
	else:
		recipe_icon.texture = null
		description.text = ""



func _on_background_pressed():
	pass
