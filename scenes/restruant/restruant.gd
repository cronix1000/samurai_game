extends Node2D

@onready var recipe_pos1 = $rec1
@onready var recipe_pos2 = $rec2
@onready var recipe_pos3 = $rec3
@export var recipe_button : PackedScene
var Inventory : Inventory
var recipe_keys = ["burger", "salmon", "tomato_patch", "salad", "steak", "baked_fish"]
var active_minigame

var recipes = []
func _ready():
	self.Inventory = inventory
	await "process_frame"
	pick_recipes()
	display_recipes()
	
	
func pick_recipes():
	for recipe in GameManager.recipes:
		print(GameManager.recipes)
		for item in GameManager.get_recipe_by_key(recipe)["ingredients_comp"]:
			var quant = GameManager.get_recipe_by_key(recipe)["ingredients_comp"][item]
			var item_inv = GameManager.get_item_by_key(item)
			if(inventory.check_inv_for_item_quant(item_inv, quant)):
				recipes.append(recipe)
			else:
				break
				
	print("hello")
	#recipes.append(GameManager.get_recipe_by_key(recipe_keys.pick_random()))
	#recipes.append(GameManager.get_recipe_by_key(recipe_keys.pick_random()))
	
	
func display_recipes():
	var list_pos = [recipe_pos1.position, recipe_pos2.position, recipe_pos3.position]
	var i = 0 
	for recipe in recipes:
		var recipe_holder_inst = recipe_button.instantiate()
		recipe_holder_inst.display_item(recipe)
		recipe_holder_inst.connect("run_games", Callable(self, "load_game"))
		recipe_holder_inst.position = list_pos[i]
		add_child(recipe_holder_inst)
		i += 1
		

func load_game(ingredients):
	pass
		
