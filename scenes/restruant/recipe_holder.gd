extends TextureButton
class_name recipe_holder


@onready var description = $description
@onready var recipe_icon = $recipe
var item
signal run_games(ingredients)

func display_item(item):
	await ready
	
	if item:
		self.item = item
		var texture =  load("res://recipes/" + item["key"]+".png")
		recipe_icon.texture = texture
		description.text = str(item["key"]) if item["key"] else ""
	else:
		#recipe_icon.texture = null
		description.text = ""



func _on_pressed():
	var ingredient_lc
	for ingredient in item.ingredients:
		if(ingredient_lc != ingredient):
			ingredient_lc = ingredient
			var minigame = load("res://scenes/restruant/minigames/cutting_board_" + ingredient + ".tscn")
			var mini_game = minigame.instantiate()
			get_parent().add_child(mini_game)
			await mini_game.get_child(1).completed
	queue_free()
	emit_signal("run_games", item)
