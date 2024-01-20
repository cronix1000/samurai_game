extends EnemyBase
@export var attack_range := 150

var item 



func _physics_process(delta):
	if aggro_target:
		if global_position.distance_to(aggro_target.position) >= attack_range : 
			attack()
		else:
			move_to_player()
			change_state("run")

func attack():
	die()

func move_to_player():
	die()
	if aggro_target.position.x > global_position.x:
		move_right()	
	else:
		move_left()	

func die():
	item = GameManager.get_item_by_key("tomato")
	inventory.add_item(item)
	queue_free()
