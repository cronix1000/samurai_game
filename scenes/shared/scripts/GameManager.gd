extends Node


var items
var recipes
var maps_1 = []

var attack_damage = 30
var speed = 175

func _ready():
	items = read_from_JSON_Item("res://scenes/shared/scripts/items_json.json")
	recipes = read_from_JSON("res://scenes/shared/scripts/recipes.json")
	for key in items.keys():
		items[key]["key"] = key
	for key in recipes.keys():
		recipes[key]["key"] = key
	var keys = ["fish", "meat", "fish", "lettuce", "lemon", "tomato"]
	for key in keys:
		var map_1 = load("res://scenes/main/"+ key + "_spawn_area_1.tscn")
		maps_1.append(map_1)

func get_item_by_key(key):
	if items and items.has(key):
		return items[key].duplicate(true)

func get_recipe_by_key(key):
	if recipes and recipes.has(key):
		return recipes[key].duplicate(true)
	
func get_recipes():
	return recipes

func read_from_JSON_Item(path):
		if(FileAccess.file_exists(path)):
			var file = FileAccess.open(path, FileAccess.READ)
			
			var string = file.get_as_text()
			var json = JSON.new()
			var error = json.parse(string)
			var data = json.data
			file.close()
			return data
		else:
			printerr("Invalid Path")

func read_from_JSON(path):
		if(FileAccess.file_exists(path)):
			var file = FileAccess.open(path, FileAccess.READ)
			
			var string = file.get_as_text()
			var json = JSON.new()
			var error = json.parse(string)
			var data = json.data
			file.close()
			return data
		else:
			printerr("Invalid Path")

func switch_to_restruant():
	var restruant = load("res://scenes/restruant/restruant.tscn").instantiate()
	get_tree().root.add_child(restruant)

func return_to_home():
	var restruant = load("res://scenes/main/main.tscn").instantiate()
	get_tree().root.add_child(restruant)
	
func switch_maps_1():
	var map = maps_1.pick_random().instantiate()
	get_tree().root.add_child(map)
	
	
	
	
